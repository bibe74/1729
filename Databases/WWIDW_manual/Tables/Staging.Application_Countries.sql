CREATE TABLE [Staging].[Application_Countries]
(
[CountryID] [int] NOT NULL,
[CountryName] [nvarchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Region] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Subregion] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[Application_Countries] ADD CONSTRAINT [PK_Application_Countries] PRIMARY KEY CLUSTERED  ([CountryID]) ON [PRIMARY]
GO
