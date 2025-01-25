CREATE TABLE [Setup].[SourceColumns]
(
[SourceColumnID] [int] NOT NULL IDENTITY(1, 1),
[SourceTableID] [int] NOT NULL,
[SourceSchema] [sys].[sysname] NOT NULL,
[SourceTable] [sys].[sysname] NOT NULL,
[SourceColumn] [sys].[sysname] NOT NULL,
[UseForDataWarehouse] [bit] NOT NULL CONSTRAINT [DFT_Setup_SourceColumns_UseForDataWarehouse] DEFAULT ((0)),
[IsPrimaryKey] [bit] NOT NULL CONSTRAINT [DFT_Setup_SourceColumns_IsPrimaryKey] DEFAULT ((0)),
[PublishToDataWarehouse] [bit] NOT NULL CONSTRAINT [DFT_Setup_SourceColumns_PublishToDataWarehouse] DEFAULT ((0)),
[DataWarehouseSchema] [sys].[sysname] NOT NULL CONSTRAINT [DFT_Setup_SourceColumns_DataWarehouseSchema] DEFAULT (N''),
[DataWarehouseTable] [sys].[sysname] NOT NULL CONSTRAINT [DFT_Setup_SourceColumns_DataWarehouseTable] DEFAULT (N''),
[DataWarehouseColumn] [sys].[sysname] NOT NULL CONSTRAINT [DFT_Setup_SourceColumns_DataWarehouseColumn] DEFAULT (N'')
) ON [PRIMARY]
GO
ALTER TABLE [Setup].[SourceColumns] ADD CONSTRAINT [PK_Setup_SourceColumns] PRIMARY KEY CLUSTERED  ([SourceColumnID]) ON [PRIMARY]
GO
ALTER TABLE [Setup].[SourceColumns] ADD CONSTRAINT [FK_Setup_SourceColumns_SourceTableID] FOREIGN KEY ([SourceTableID]) REFERENCES [Setup].[SourceTables] ([SourceTableID])
GO
