CREATE TABLE [dbo].[country-codes-iso3166-2]
(
[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Code] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[country-codes-iso3166-2] ADD CONSTRAINT [PK_country-codes-iso3166-2] PRIMARY KEY CLUSTERED  ([Code]) ON [PRIMARY]
GO
