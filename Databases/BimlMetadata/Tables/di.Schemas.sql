CREATE TABLE [di].[Schemas]
(
[SchemaID] [int] NOT NULL IDENTITY(1, 1),
[DatabaseID] [int] NOT NULL,
[SchemaName] [sys].[sysname] NOT NULL,
[DBSchemaId] [int] NOT NULL,
[RefreshMetadata] [int] NULL CONSTRAINT [DF_Schemas_RefreshMetadata] DEFAULT ((-1)),
[GenerateBimlFlag] [bit] NULL,
[DateAdded] [datetime] NULL CONSTRAINT [DF_Schemas_DateAdded] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [di].[Schemas] ADD CONSTRAINT [PK_di_Schemas] PRIMARY KEY CLUSTERED  ([SchemaID]) ON [PRIMARY]
GO
ALTER TABLE [di].[Schemas] ADD CONSTRAINT [FK_di_Schemas_Databases] FOREIGN KEY ([DatabaseID]) REFERENCES [di].[Databases] ([DatabaseID])
GO
