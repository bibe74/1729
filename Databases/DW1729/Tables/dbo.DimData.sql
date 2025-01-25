CREATE TABLE [dbo].[DimData]
(
[PKData] [date] NOT NULL,
[Data] [date] NOT NULL,
[Anno] [int] NULL,
[Mese] [int] NULL,
[MeseDescrizione] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Giorno] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimData] ADD CONSTRAINT [PK_DimData] PRIMARY KEY CLUSTERED  ([PKData]) ON [PRIMARY]
GO
