CREATE TABLE [Setup].[SourceDatabases]
(
[SourceDatabaseID] [tinyint] NOT NULL IDENTITY(1, 1),
[SourceInstance] [nvarchar] (40) COLLATE Latin1_General_100_CI_AS NOT NULL,
[SourceDatabase] [sys].[sysname] NOT NULL,
[SourceConnectionName] [nvarchar] (40) COLLATE Latin1_General_100_CI_AS NOT NULL,
[SourceConnectionString] [nvarchar] (255) COLLATE Latin1_General_100_CI_AS NOT NULL,
[DestinationDatabase] [sys].[sysname] NOT NULL,
[DestinationConnectionName] [nvarchar] (40) COLLATE Latin1_General_100_CI_AS NOT NULL,
[DestinationConnectionString] [nvarchar] (255) COLLATE Latin1_General_100_CI_AS NOT NULL,
[DestinationLandingSchema] [sys].[sysname] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Setup].[SourceDatabases] ADD CONSTRAINT [PK_Setup_SourceDatabases] PRIMARY KEY CLUSTERED  ([SourceDatabaseID]) ON [PRIMARY]
GO
