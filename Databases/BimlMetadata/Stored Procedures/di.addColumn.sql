SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE Procedure [di].[addColumn]
  @ConnectionName sysname
, @DatabaseName sysname
, @SchemaName sysname
, @TableName sysname
, @ColumnName sysname
, @ColumnDataType sysname
, @ColumnMaxLength int
, @ColumnIsIdentity bit
, @ColumnPrecision int
, @ColumnScale int
, @IsNullable bit
, @IsIdentity bit
, @RefreshMetadata int
, @GenerateBimlFlag bit
, @ColumnAliasName varchar(255)
, @ColumnConvertDataType sysname
, @ColumnConvertMaxLength int
, @ColumnConvertPrecision int
, @ColumnConvertScale int
As
 begin
  declare @ConnectionID int = (Select ConnectionID 
                               From di.Connections
							   Where ConnectionName = @ConnectionName)
  declare @DatabaseID int = (Select DatabaseID 
                             From di.[Databases]
							 Where DatabaseName = @DatabaseName
							   And ConnectionID = @ConnectionID)
  declare @SchemaID int = (Select SchemaID 
                           From di.[Schemas]
						   Where SchemaName = @SchemaName
						     And DatabaseID = @DatabaseID)
  declare @TableID int = (Select TableID 
                          From di.[Tables]
						  Where TableName = @TableName
						    And SchemaID = @SchemaID)
  declare @ErrMsg varchar(1000)

  If (@ConnectionID Is NULL)
   begin
    Set @ErrMsg = 'Cannot locate a ConnectionID value for ConnectionName: ' + Coalesce(@ConnectionName, '[NULL]')
	RaisError(@ErrMsg, 16, 1)
   end

  If (@DatabaseID Is NULL)
   begin
    Set @ErrMsg = 'Cannot locate a DatabaseID value for DatabaseName: ' + Coalesce(@DatabaseName, '[NULL]')
	RaisError(@ErrMsg, 16, 1)
   end

  If (@SchemaID Is NULL)
   begin
    Set @ErrMsg = 'Cannot locate a SchemaID value for SchemaName: ' + Coalesce(@SchemaName, '[NULL]')
	RaisError(@ErrMsg, 16, 1)
   end

  If (@TableID Is NULL)
   begin
    Set @ErrMsg = 'Cannot locate a TableID value for TableName: ' + Coalesce(@TableName, '[NULL]')
	RaisError(@ErrMsg, 16, 1)
   end

  If Exists(Select 1
            From di.[Columns]
			Where TableID = @TableID
			  And ColumnName = @ColumnName)
   begin
    Set @ErrMsg = 'There is already a ColumnName: ' + Coalesce(@ColumnName, '[NULL]') + ' for TableName: ' + Coalesce(@TableName, '[NULL]') + ' in the COlumns table.'
	RaisError(@ErrMsg, 16, 1)
   end
  Else
   begin
    Insert Into di.[Columns]
	(
	   TableID
	 , ColumnName
	 , ColumnDataType 
	 , ColumnMaxLength
	 , ColumnIsIdentity
	 , ColumnPrecision
	 , ColumnScale
	 , IsNullable
	 , IsIdentity
	 , RefreshMetadata
	 , GenerateBimlFlag
	 , ColumnAliasName
	 , ColumnConvertDataType
	 , ColumnConvertMaxLength
	 , ColumnConvertPrecision
	 , ColumnConvertScale
	)
	Values
	(
	   @TableID
	 , @ColumnName
	 , @ColumnDataType 
	 , @ColumnMaxLength
	 , @ColumnIsIdentity
	 , @ColumnPrecision
	 , @ColumnScale
	 , @IsNullable
	 , @IsIdentity
	 , @RefreshMetadata
	 , @GenerateBimlFlag
	 , @ColumnAliasName
	 , @ColumnConvertDataType
	 , @ColumnConvertMaxLength
	 , @ColumnConvertPrecision
	 , @ColumnConvertScale
    )
   end
 end




GO
