SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE Procedure [di].[BuildColumnCreateSql]
 @TableID int
--, @sql varchar(8000) OUTPUT
As

  declare @DestinationColumnName varchar(255)
  declare @DestinationColumnType varchar(255)
  declare @DestinationColumnLength varchar(12)
  declare @DestinationColumnPrecision int
  declare @DestinationColumnScale int
  declare @DestinationColumnIsNullable bit
  declare @CrLf char(2) = Char(13) + Char(10)
  declare @modifier varchar(25) = ''
  declare @nu varchar(12) = ' NOT NULL '

  declare curCols cursor for
  Select distinct 
    '[' + Case When ((m.DestinationColumnAliasName Is Not NULL) And (m.DestinationColumnAliasName <> '')) Then m.DestinationColumnAliasName Else m.DestinationColumnName End + ']'
  , Case When ((m.DestinationColumnConvertType Is Not NULL) And (m.DestinationColumnConvertType <> '')) Then m.DestinationColumnConvertType Else m.DestinationColumnType End
  , Case When ((m.DestinationColumnConvertLength = -1) Or (m.DestinationColumnLength = -1)) Then 'max' 
         When (((m.DestinationColumnConvertType = 'nvarchar') Or (m.DestinationColumnType = 'nvarchar')) And ((m.DestinationColumnConvertLength > 4000) Or (m.DestinationColumnLength > 4000))) Then '4000'
         When ((m.DestinationColumnConvertLength Is Not NULL) And (m.DestinationColumnConvertLength <> 0)) Then Convert(varchar(25), m.DestinationColumnConvertLength) 
    Else Convert(varchar(25), m.DestinationColumnLength) End
  , Case When ((m.DestinationColumnConvertPrecision Is Not NULL) And (m.DestinationColumnConvertPrecision <> 0)) Then m.DestinationColumnConvertPrecision Else m.DestinationColumnPrecision End
  , Case When ((m.DestinationColumnConvertScale Is Not NULL) And (m.DestinationColumnConvertScale <> 0)) Then m.DestinationColumnConvertScale Else m.DestinationColumnScale End
  , m.DestinationColumnIsNullable
  From di.MappingsMetadata m 
  Where m.DestinationTableID = @TableID 
    And m.SourceColumnGenerateBimlFlag = 1
	And m.DestinationColumnGenerateBimlFlag = 1

  open curCols

  fetch next from curCols into @DestinationColumnName, @DestinationColumnType, @DestinationColumnLength, @DestinationColumnPrecision, @DestinationColumnScale, @DestinationColumnIsNullable

  declare @sql varchar(8000) = ''

  while (@@fetch_status = 0)
   begin
	if(@DestinationColumnIsNullable = 1)
	begin
		Set @nu = ' NULL ';
	end
	
	Select @modifier = Case When (@DestinationColumnType In ('decimal', 'numeric'))
	                        Then '(' + Convert(varchar(12), @DestinationColumnPrecision) + ', ' + Convert(varchar(12), @DestinationColumnScale) + ') '
							When (@DestinationColumnType In ('binary', 'char', 'nchar', 'nvarchar', 'varbinary', 'varchar'))
	                        Then '(' + @DestinationColumnLength + ') '
					   Else ''
					   End

	Select @sql = @sql + @CrLf + '      ' + @DestinationColumnName + ' ' + @DestinationColumnType + @modifier + @nu + ','

	fetch next from curCols into @DestinationColumnName, @DestinationColumnType, @DestinationColumnLength, @DestinationColumnPrecision, @DestinationColumnScale, @DestinationColumnIsNullable

   end

  close curCols
  deallocate curCols

  Select Right(@sql, Len(@sql) - 1) As sql





GO
