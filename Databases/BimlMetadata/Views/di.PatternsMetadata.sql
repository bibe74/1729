SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

Create View [di].[PatternsMetadata]
As

Select distinct
   scn.ConnectionName As SourceConnectionName
 , scn.ConnectionID As SourceConnectionId
 , scn.GenerateBimlFlag As SourceConnectionGenerateBimlFlag
 , sd.DatabaseName As SourceDatabaseName
 , sd.DatabaseID As SourceDatabaseID
 , sd.RefreshMetadata As RefreshSourceDatabaseMetadata
 , sd.GenerateBimlFlag As SourceDatabaseGenerateBimlFlag
 , ss.SchemaName As SourceSchemaName
 , ss.SchemaID As SourceSchemaID
 , ss.RefreshMetadata As RefreshSourceSchemaMetadata
 , ss.GenerateBimlFlag As SourceSchemaGenerateBimlFlag
 , st.TableName As SourceTableName
 , st.TableAliasName As SourceTableAliasName
 , st.TableID As SourceTableID
 , st.RefreshMetadata As RefreshSourceTableMetadata
 , st.GenerateBimlFlag As SourceTableGenerateBimlFlag
 , sp.PatternName As SourceTablePatternName
 , dcn.ConnectionName As DestinationConnectionName
 , dcn.ConnectionID As DestinationConnectionId
 , dcn.GenerateBimlFlag As DestinationConnectionGenerateBimlFlag
 , dd.DatabaseName As DestinationDatabaseName
 , dd.DatabaseID As DestinationDatabaseID
 , dd.RefreshMetadata As RefreshDestinationDatabaseMetadata
 , dd.GenerateBimlFlag As DestinationDatabaseGenerateBimlFlag
 , ds.SchemaName As DestinationSchemaName
 , ds.SchemaID As DestinationSchemaID
 , ds.RefreshMetadata As RefreshDestinationSchemaMetadata
 , ds.GenerateBimlFlag As DestinationSchemaGenerateBimlFlag
 , dt.TableName As DestinationTableName
 , dt.TableAliasName As DestinationTableAliasName
 , dt.TableID As DestinationTableID
 , dt.RefreshMetadata As RefreshDestinationTableMetadata
 , dt.GenerateBimlFlag As DestinationTableGenerateBimlFlag
 , dp.PatternName As DestinationTablePatternName
 , dpr.ProjectName As DestinationTableProjectName
From di.Mappings sm
Join di.[Columns] sc
  On sc.ColumnID = sm.SourceColumnID
Join di.[Tables] st
  On st.TableID = sc.TableID
Join di.TablePatterns stp
  On stp.TableID = st.TableID
Join di.Patterns sp
  On sp.PatternID = stp.PatternID
Join di.[Schemas] ss
  On ss.SchemaID = st.SchemaID
Join di.[Databases] sd
  On sd.DatabaseId = ss.DatabaseID
Join di.Connections scn
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
Join di.TablePatterns dtp
  On dtp.TableID = dt.TableID
Join di.Patterns dp
  On dp.PatternID = dtp.PatternID
Join di.TableProjects dtpr
  On dtpr.TableID = dt.TableID
Join di.Projects dpr
  On dpr.ProjectID = dtpr.ProjectID
Where scn.ConnectionID > 0
  And sd.DatabaseId > 0
  And ss.SchemaID > 0
  And st.TableID > 0
  And sc.ColumnID > 0
  And stp.PatternID > 0





GO
