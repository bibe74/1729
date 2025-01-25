CREATE TABLE [di].[Connections]
(
[ConnectionID] [int] NOT NULL IDENTITY(1, 1),
[ConnectionName] [sys].[sysname] NOT NULL,
[ConnectionString] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RefreshMetadata] [int] NULL CONSTRAINT [DF_Connections_RefreshMetadata] DEFAULT ((-1)),
[GenerateBimlFlag] [bit] NULL,
[CreateInProject] [bit] NULL,
[ConnectionFunction] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateAdded] [datetime] NULL CONSTRAINT [DF_Connections_DateAdded] DEFAULT (getdate()),
[ConnectionCollectionID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [di].[Connections] ADD CONSTRAINT [PK_di_Connections] PRIMARY KEY CLUSTERED  ([ConnectionID]) ON [PRIMARY]
GO
