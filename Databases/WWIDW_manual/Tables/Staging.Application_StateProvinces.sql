CREATE TABLE [Staging].[Application_StateProvinces]
(
[StateProvinceID] [int] NOT NULL,
[StateProvinceCode] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StateProvinceName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CountryID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[Application_StateProvinces] ADD CONSTRAINT [PK_Application_StateProvinces] PRIMARY KEY CLUSTERED  ([StateProvinceID]) ON [PRIMARY]
GO
