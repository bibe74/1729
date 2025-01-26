CREATE TABLE [dbo].[SqlServerVersions]
(
[MajorVersionNumber] [tinyint] NOT NULL,
[MinorVersionNumber] [smallint] NOT NULL,
[Branch] [varchar] (34) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Url] [varchar] (99) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ReleaseDate] [date] NOT NULL,
[MainstreamSupportEndDate] [date] NOT NULL,
[ExtendedSupportEndDate] [date] NOT NULL,
[MajorVersionName] [varchar] (19) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MinorVersionName] [varchar] (67) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SqlServerVersions] ADD CONSTRAINT [PK_SqlServerVersions] PRIMARY KEY CLUSTERED ([MajorVersionNumber], [MinorVersionNumber], [ReleaseDate]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'Description', N'A reference for SQL Server major and minor versions.', 'SCHEMA', N'dbo', 'TABLE', N'SqlServerVersions', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'The update level of the build. CU indicates a cumulative update. SP indicates a service pack. RTM indicates Release To Manufacturer. GDR indicates a General Distribution Release. QFE indicates Quick Fix Engineering (aka hotfix).', 'SCHEMA', N'dbo', 'TABLE', N'SqlServerVersions', 'COLUMN', N'Branch'
GO
EXEC sp_addextendedproperty N'Description', N'The date extended Microsoft support ends for the version.', 'SCHEMA', N'dbo', 'TABLE', N'SqlServerVersions', 'COLUMN', N'ExtendedSupportEndDate'
GO
EXEC sp_addextendedproperty N'Description', N'The date main stream Microsoft support ends for the version.', 'SCHEMA', N'dbo', 'TABLE', N'SqlServerVersions', 'COLUMN', N'MainstreamSupportEndDate'
GO
EXEC sp_addextendedproperty N'Description', N'The major version name.', 'SCHEMA', N'dbo', 'TABLE', N'SqlServerVersions', 'COLUMN', N'MajorVersionName'
GO
EXEC sp_addextendedproperty N'Description', N'The major version number.', 'SCHEMA', N'dbo', 'TABLE', N'SqlServerVersions', 'COLUMN', N'MajorVersionNumber'
GO
EXEC sp_addextendedproperty N'Description', N'The minor version name.', 'SCHEMA', N'dbo', 'TABLE', N'SqlServerVersions', 'COLUMN', N'MinorVersionName'
GO
EXEC sp_addextendedproperty N'Description', N'The minor version number.', 'SCHEMA', N'dbo', 'TABLE', N'SqlServerVersions', 'COLUMN', N'MinorVersionNumber'
GO
EXEC sp_addextendedproperty N'Description', N'The date the version was publicly released.', 'SCHEMA', N'dbo', 'TABLE', N'SqlServerVersions', 'COLUMN', N'ReleaseDate'
GO
EXEC sp_addextendedproperty N'Description', N'A link to the KB article for a version.', 'SCHEMA', N'dbo', 'TABLE', N'SqlServerVersions', 'COLUMN', N'Url'
GO
