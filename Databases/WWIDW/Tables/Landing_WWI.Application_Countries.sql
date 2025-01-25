CREATE TABLE [Landing_WWI].[Application_Countries]
(
[CountryID] [int] NOT NULL,
[CountryName] [nvarchar] (60) COLLATE Latin1_General_100_CI_AS NOT NULL,
[Region] [nvarchar] (30) COLLATE Latin1_General_100_CI_AS NOT NULL,
[Subregion] [nvarchar] (30) COLLATE Latin1_General_100_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing_WWI].[Application_Countries] ADD CONSTRAINT [PK_Landing_WWI_Application_Countries] PRIMARY KEY CLUSTERED  ([CountryID]) ON [PRIMARY]
GO
