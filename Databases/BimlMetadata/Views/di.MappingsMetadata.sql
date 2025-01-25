SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO








CREATE View [di].[MappingsMetadata]
As

Select
   scn.ConnectionName As SourceConnectionName
 , scn.ConnectionID As SourceConnectionId
 , scn.GenerateBimlFlag As SourceConnectionGenerateBimlFlag
 , scn.ConnectionFunction As SourceConnectionFunction
 , sd.DatabaseName As SourceDatabaseName
 , sd.DatabaseID As SourceDatabaseID
 , sd.RefreshMetadata As SourceDatabaseRefreshMetadata
 , sd.GenerateBimlFlag As SourceDatabaseGenerateBimlFlag
 , ss.SchemaName As SourceSchemaName
 , ss.SchemaID As SourceSchemaID
 , ss.RefreshMetadata As SourceSchemaRefreshMetadata
 , ss.GenerateBimlFlag As SourceSchemaGenerateBimlFlag
 , st.TableName As SourceTableName
 , st.TableAliasName As SourceTableAliasName
 , st.TableID As SourceTableID
 , st.RefreshMetadata As SourceTableRefreshMetadata
 , st.GenerateBimlFlag As SourceTableGenerateBimlFlag
 , sc.ColumnName As SourceColumnName
 , sc.ColumnID As SourceColumnID
 , sc.ColumnDataType As SourceColumnType
 , sc.ColumnMaxLength As SourceColumnLength
 , sc.ColumnPrecision As SourceColumnPrecision
 , sc.ColumnScale As SourceColumnScale
 , sc.ColumnAliasName As SourceColumnAliasName
 , sc.ColumnConvertDataType As SourceColumnConvertType
 , sc.ColumnConvertMaxLength As SourceColumnConvertLength
 , sc.ColumnConvertPrecision As SourceColumnConvertPrecision
 , sc.ColumnConvertScale As SourceColumnConvertScale
 , sc.IsNullable As SourceColumnIsNullable
 , sc.RefreshMetadata As SourceColumnRefreshMetadata
 , sc.GenerateBimlFlag As SourceColumnGenerateBimlFlag
 , sm.IsColumnBusinessKey As SourceColumnIsBusinesIsKey
 , sm.IsETLInstrumentation As SourceColumnIsETLInstrumentation
 , dcn.ConnectionName As DestinationConnectionName
 , dcn.ConnectionID As DestinationConnectionId
 , dcn.GenerateBimlFlag As DestinationConnectionGenerateBimlFlag
 , dcn.ConnectionFunction As DestinationConnectionFunction
 , dd.DatabaseName As DestinationDatabaseName
 , dd.DatabaseID As DestinationDatabaseID
 , dd.RefreshMetadata As DestinationDatabaseRefreshMetadata
 , dd.GenerateBimlFlag As DestinationDatabaseGenerateBimlFlag
 , ds.SchemaName As DestinationSchemaName
 , ds.SchemaID As DestinationSchemaID
 , ds.RefreshMetadata As DestinationSchemaRefreshMetadata
 , ds.GenerateBimlFlag As DestinationSchemaGenerateBimlFlag
 , dt.TableName As DestinationTableName
 , dt.TableAliasName As DestinationTableAliasName
 , dt.TableID As DestinationTableID
 , dt.RefreshMetadata As DestinationTableRefreshMetadata
 , dt.GenerateBimlFlag As DestinationTableGenerateBimlFlag
 , dc.ColumnName As DestinationColumnName
 , dc.ColumnID As DestinationColumnID
 , dc.ColumnDataType As DestinationColumnType
 , dc.ColumnMaxLength As DestinationColumnLength
 , dc.ColumnPrecision As DestinationColumnPrecision
 , dc.ColumnScale As DestinationColumnScale
 , dc.ColumnAliasName As DestinationColumnAliasName
 , Case When dtm.DataType = dc.ColumnConvertDataType
        Then dtm.DataTypeMapsTo
        Else dc.ColumnConvertDataType
   End As DestinationColumnConvertType
 , Case When dtm.DataType = dc.ColumnConvertDataType
        Then Coalesce(dtm.MapsToLength, dc.ColumnConvertMaxLength)
        Else dc.ColumnConvertMaxLength
   End As DestinationColumnConvertLength
 , Case When dtm.DataType = dc.ColumnConvertDataType
        Then Coalesce(dtm.MapsToPrecision, dc.ColumnConvertPrecision)
        Else dc.ColumnConvertPrecision
   End As DestinationColumnConvertPrecision
 , Case When dtm.DataType = dc.ColumnConvertDataType
        Then Coalesce(dtm.MapsToScale, dc.ColumnConvertScale)
        Else dc.ColumnConvertScale
   End As DestinationColumnConvertScale
 , dc.IsNullable As DestinationColumnIsNullable
 , dc.RefreshMetadata As DestinationColumnRefreshMetadata
 , dc.GenerateBimlFlag As DestinationColumnGenerateBimlFlag
 , dm.IsColumnBusinessKey As DestinationColumnIsBusinessKey
 , dm.IsETLInstrumentation As DestinationColumnIsETLInstrumentation
 , dm.DerivedExpression As DestinationColumnDerivedExpression
From di.Mappings sm
Left Join di.[Columns] sc
  On sc.ColumnID = sm.SourceColumnID
Left Join di.[Tables] st
  On st.TableID = sc.TableID
Left Join di.[Schemas] ss
  On ss.SchemaID = st.SchemaID
Left Join di.[Databases] sd
  On sd.DatabaseId = ss.DatabaseID
Left Join di.Connections scn
  On scn.ConnectionID = sd.ConnectionId
Join di.Mappings dm
  On dm.DestinationColumnID = sm.DestinationColumnID
Join di.[Columns] dc
  On dc.ColumnID = dm.DestinationColumnID
Join di.[Tables] dt
  On dt.TableID = dc.TableID
Join di.[Schemas] ds
  On ds.SchemaID = dt.SchemaID
Join di.[Databases] dd
  On dd.DatabaseId = ds.DatabaseID
Join di.Connections dcn
  On dcn.ConnectionID = dd.ConnectionId
Left Join di.DataTypeMap dtm
  On dtm.DataType = dc.ColumnConvertDataType
Where dcn.ConnectionID > 0
  And dd.DatabaseId > 0
  And ds.SchemaID > 0
  And dt.TableID > 0
  And dc.ColumnID > 0










GO
