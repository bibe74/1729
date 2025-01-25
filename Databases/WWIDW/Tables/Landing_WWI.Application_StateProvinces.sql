CREATE TABLE [Landing_WWI].[Application_StateProvinces]
(
[StateProvinceID] [int] NOT NULL,
[StateProvinceName] [nvarchar] (50) COLLATE Latin1_General_100_CI_AS NOT NULL,
[CountryID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing_WWI].[Application_StateProvinces] ADD CONSTRAINT [PK_Landing_WWI_Application_StateProvinces] PRIMARY KEY CLUSTERED  ([StateProvinceID]) ON [PRIMARY]
GO
