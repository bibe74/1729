CREATE TABLE [Landing_WWI].[Application_Cities]
(
[CityID] [int] NOT NULL,
[CityName] [nvarchar] (50) COLLATE Latin1_General_100_CI_AS NOT NULL,
[StateProvinceID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing_WWI].[Application_Cities] ADD CONSTRAINT [PK_Landing_WWI_Application_Cities] PRIMARY KEY CLUSTERED  ([CityID]) ON [PRIMARY]
GO
