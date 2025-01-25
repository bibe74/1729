CREATE TABLE [dbo].[DimData]
(
[PKData] [date] NOT NULL,
[Data] [date] NOT NULL,
[DataDescrizione] [char] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[DataEstesa] [date] NOT NULL,
[DataEstesaDescrizione] [varchar] (27) COLLATE Latin1_General_CI_AS NOT NULL,
[Anno] [int] NOT NULL,
[AnnoDescrizione] [char] (4) COLLATE Latin1_General_CI_AS NOT NULL,
[Mese] [int] NOT NULL,
[MeseDescrizione] [varchar] (9) COLLATE Latin1_General_CI_AS NOT NULL,
[MeseAnno] [int] NOT NULL,
[MeseAnnoDescrizione] [varchar] (14) COLLATE Latin1_General_CI_AS NOT NULL,
[DataNumerica] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimData] ADD CONSTRAINT [PK_dbo_DimData] PRIMARY KEY CLUSTERED  ([PKData]) ON [PRIMARY]
GO
