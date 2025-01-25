CREATE TABLE [di].[Tables]
(
[TableID] [int] NOT NULL IDENTITY(1, 1),
[SchemaID] [int] NOT NULL,
[TableName] [sys].[sysname] NOT NULL,
[DBTableId] [int] NOT NULL,
[RefreshMetadata] [int] NULL CONSTRAINT [DF_Tables_RefreshMetadata] DEFAULT ((-1)),
[GenerateBimlFlag] [bit] NULL,
[TableAliasName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateAdded] [datetime] NULL CONSTRAINT [DF_Tables_DateAdded] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [di].[Tables] ADD CONSTRAINT [PK_di_Tables] PRIMARY KEY CLUSTERED  ([TableID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Tables_SchemaID] ON [di].[Tables] ([SchemaID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Tables_TableName] ON [di].[Tables] ([TableName]) ON [PRIMARY]
GO
ALTER TABLE [di].[Tables] ADD CONSTRAINT [FK_di_Tables_Schemas] FOREIGN KEY ([SchemaID]) REFERENCES [di].[Schemas] ([SchemaID])
GO
