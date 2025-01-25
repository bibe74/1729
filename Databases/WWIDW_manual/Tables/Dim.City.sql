CREATE TABLE [Dim].[City]
(
[CityKey] [int] NOT NULL IDENTITY(1, 1),
[CityID] [int] NOT NULL,
[CityName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StateProvinceCode] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StateProvinceName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CountryName] [nvarchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Region] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Subregion] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HistoricalHashKey] [varbinary] (20) NOT NULL,
[ChangeHashKey] [varbinary] (20) NOT NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[InsertDttm] [datetime] NOT NULL,
[UpdateDttm] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Dim].[City] ADD CONSTRAINT [PK_Dim_City] PRIMARY KEY CLUSTERED  ([CityKey]) ON [PRIMARY]
GO
