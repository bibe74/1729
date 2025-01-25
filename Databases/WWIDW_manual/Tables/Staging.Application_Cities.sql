CREATE TABLE [Staging].[Application_Cities]
(
[CityID] [int] NOT NULL,
[CityName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StateProvinceID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[Application_Cities] ADD CONSTRAINT [PK_Application_Cities] PRIMARY KEY CLUSTERED  ([CityID]) ON [PRIMARY]
GO
