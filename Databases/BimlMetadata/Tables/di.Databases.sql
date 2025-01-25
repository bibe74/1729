CREATE TABLE [di].[Databases]
(
[DatabaseID] [int] NOT NULL IDENTITY(1, 1),
[ConnectionID] [int] NOT NULL,
[DatabaseName] [sys].[sysname] NOT NULL,
[DBDatabaseId] [int] NOT NULL,
[RefreshMetadata] [int] NULL CONSTRAINT [DF_Databases_RefreshMetadata] DEFAULT ((-1)),
[GenerateBimlFlag] [bit] NULL,
[DateAdded] [datetime] NULL CONSTRAINT [DF_Databases_DateAdded] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [di].[Databases] ADD CONSTRAINT [PK_di_Databases] PRIMARY KEY CLUSTERED  ([DatabaseID]) ON [PRIMARY]
GO
ALTER TABLE [di].[Databases] ADD CONSTRAINT [FK_di_Databases_Connections] FOREIGN KEY ([ConnectionID]) REFERENCES [di].[Connections] ([ConnectionID])
GO
