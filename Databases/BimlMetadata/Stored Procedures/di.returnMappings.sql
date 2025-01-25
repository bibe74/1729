SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE Procedure [di].[returnMappings]
  @SourceTableID int
, @DestinationTableID int
As
Select distinct
    '[' + sc.ColumnName + ']' As SourceColumnName
,   sc.ColumnDataType As SourceColumnDataType
,   sc.ColumnMaxLength As SourceColumnMaxLength
,   sc.ColumnPrecision As SourceColumnPrecision
,   sc.ColumnScale As SourceColumnScale
,   sc.IsNullable As SourceIsNullable
,   sc.IsIdentity As SourceColumnIsIdentity
,   '[' + sc.ColumnAliasName + ']' As SourceColumnAliasName
,   Case When stm.DataType = sc.ColumnConvertDataType
         Then stm.DataTypeMapsTo
		 Else sc.ColumnConvertDataType
	End As SourceColumnConvertDataType
,   Case When stm.DataType = sc.ColumnConvertDataType
         Then Coalesce(stm.MapsToLength, sc.ColumnConvertMaxLength)
		 Else sc.ColumnConvertMaxLength
	End As SourceColumnConvertMaxLength
,   Case When stm.DataType = sc.ColumnConvertDataType
         Then Coalesce(stm.MapsToPrecision, sc.ColumnConvertPrecision)
		 Else sc.ColumnConvertPrecision
    End As SourceColumnConvertPrecision
,   Case When stm.DataType = sc.ColumnConvertDataType
         Then Coalesce(stm.MapsToScale, sc.ColumnConvertScale)
		 Else sc.ColumnConvertScale
	End As SourceColumnConvertScale
,   '[' + dc.ColumnName + ']' As DestinationColumnName
,   dc.ColumnDataType As DestinationColumnDataType
,   dc.ColumnMaxLength As DestinationColumnMaxLength
,   dc.ColumnPrecision As DestinationColumnPrecision
,   dc.ColumnScale As DestinationColumnScale
,   dc.IsNullable As DestinationIsNullable
,   dc.IsIdentity As DestinationColumnIsIdentity
,   '[' + dc.ColumnAliasName + ']' As DestinationColumnAliasName
,   Case When dtm.DataType = dc.ColumnConvertDataType
         Then dtm.DataTypeMapsTo
		 Else dc.ColumnConvertDataType
    End As DestinationColumnConvertDataType
,   Case When dtm.DataType = dc.ColumnConvertDataType
         Then Coalesce(dtm.MapsToLength, dc.ColumnConvertMaxLength)
		 Else dc.ColumnConvertMaxLength
	End As DestinationColumnConvertMaxLength
,   Case When dtm.DataType = dc.ColumnConvertDataType
         Then Coalesce(dtm.MapsToPrecision, dc.ColumnConvertPrecision)
		 Else dc.ColumnConvertPrecision
    End As DestinationColumnConvertPrecision
,   Case When dtm.DataType = dc.ColumnConvertDataType
         Then Coalesce(dtm.MapsToScale, dc.ColumnConvertScale)
		 Else dc.ColumnConvertScale
	End As DestinationColumnConvertScale
,   m.DestinationColumnIsBusinessKey
,   m.DestinationColumnIsETLInstrumentation
,   m.DestinationColumnDerivedExpression 
From di.MappingsMetadata m 
Join di.[Columns] sc
  On sc.ColumnID = m.SourceColumnID 
Join di.[Columns] dc 
       On dc.ColumnID = m.DestinationColumnID 
Left Join di.DataTypeMap dtm
       On dtm.DataType = dc.ColumnConvertDataType
Left Join di.DataTypeMap stm
       On stm.DataType = sc.ColumnConvertDataType
Where m.SourceColumnGenerateBimlFlag = 1 
  And m.DestinationColumnGenerateBimlFlag = 1 
  And m.SourceTableID = @SourceTableID
  And m.DestinationTableID = @DestinationTableID

Union 

Select distinct
    NULL As SourceColumnName
,   NULL As SourceColumnDataType
,   NULL As SourceColumnMaxLength
,   NULL As SourceColumnPrecision
,   NULL As SourceColumnScale
,   NULL As SourceIsNullable
,   NULL As SourceColumnIsIdentity
,   NULL As SourceColumnAliasName
,   NULL As SourceColumnConvertDataType
,   NULL As SourceColumnConvertMaxLength
,   NULL As SourceColumnConvertPrecision
,   NULL As SourceColumnConvertScale
,   dc.ColumnName As DestinationColumnName
,   dc.ColumnDataType As DestinationColumnDataType
,   dc.ColumnMaxLength As DestinationColumnMaxLength
,   dc.ColumnPrecision As DestinationColumnPrecision
,   dc.ColumnScale As DestinationColumnScale
,   dc.IsNullable As DestinationIsNullable
,   dc.IsIdentity As DestinationColumnIsIdentity
,   dc.ColumnAliasName As DestinationColumnAliasName
,   dc.ColumnConvertDataType As DestinationColumnConvertDataType
,   dc.ColumnConvertMaxLength As DestinationColumnConvertMaxLength
,   dc.ColumnConvertPrecision As DestinationColumnConvertPrecision
,   dc.ColumnConvertScale As DestinationColumnConvertScale
,   m.DestinationColumnIsBusinessKey
,   m.DestinationColumnIsETLInstrumentation
,   m.DestinationColumnDerivedExpression 
From di.MappingsMetadata m 
Join di.[Columns] dc 
       On dc.ColumnID = m.DestinationColumnID 
Where m.DestinationColumnGenerateBimlFlag = 1 
  And m.DestinationColumnIsETLInstrumentation = 1
  And m.DestinationTableID = @DestinationTableID
Order By m.DestinationColumnIsETLInstrumentation




GO
