SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

Create View [di].[ColumnsMetadata]
As

Select
   c.ConnectionName
 , c.ConnectionID
 , d.DatabaseName
 , d.DatabaseID
 , d.DBDatabaseId
 , d.RefreshMetadata As RefreshDatabaseMetadata
 , s.SchemaName
 , s.SchemaID
 , s.RefreshMetadata As RefreshSchemaMetadata
 , t.TableName
 , t.TableAliasName
 , t.TableID
 , t.RefreshMetadata As RefreshTableMetadata
 , col.ColumnName
 , col.ColumnAliasName
 , col.ColumnID
 , col.ColumnDataType
 , col.ColumnMaxLength
 , col.ColumnPrecision
 , col.ColumnScale
 , col.IsNullable
 , col.IsIdentity
 , col.RefreshMetadata As RefreshColumnMetadata
From di.Connections c
Join di.[Databases] d
  On d.ConnectionID = c.ConnectionID
Join di.[Schemas] s
  On s.DatabaseID = d.DatabaseID
Join di.[Tables] t
  On t.SchemaID = s.SchemaID
Join di.[Columns] col
  On col.TableID = t.TableID
Where c.ConnectionID > 0
  And d.DatabaseId > 0
  And s.SchemaID > 0
  And t.TableID > 0
  And col.ColumnID > 0





GO
