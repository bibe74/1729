CREATE TABLE [Setup].[SourceTables]
(
[SourceTableID] [int] NOT NULL IDENTITY(1, 1),
[SourceDatabaseID] [tinyint] NOT NULL,
[SourceSchema] [sys].[sysname] NOT NULL,
[SourceTable] [sys].[sysname] NOT NULL,
[UseForDataWarehouse] [bit] NOT NULL CONSTRAINT [DFT_Setup_SourceTables_UseForDataWarehouse] DEFAULT ((0)),
[PublishToDataWarehouse] [bit] NOT NULL CONSTRAINT [DFT_Setup_SourceTables_PublishToDataWarehouse] DEFAULT ((0)),
[DataWarehouseSchema] [sys].[sysname] NOT NULL CONSTRAINT [DFT_Setup_SourceTables_DataWarehouseSchema] DEFAULT (N''),
[DataWarehouseTable] [sys].[sysname] NOT NULL CONSTRAINT [DFT_Setup_SourceTables_DataWarehouseTable] DEFAULT (N'')
) ON [PRIMARY]
GO
ALTER TABLE [Setup].[SourceTables] ADD CONSTRAINT [PK_Setup_SourceTables] PRIMARY KEY CLUSTERED  ([SourceTableID]) ON [PRIMARY]
GO
ALTER TABLE [Setup].[SourceTables] ADD CONSTRAINT [FK_Setup_SourceTables_SourceDatabaseID] FOREIGN KEY ([SourceDatabaseID]) REFERENCES [Setup].[SourceDatabases] ([SourceDatabaseID])
GO
