CREATE TABLE [dbo].[Percorrenze]
(
[IDPercorrenza] [int] NOT NULL IDENTITY(1, 1),
[DataPercorrenza] [date] NOT NULL,
[IDTipoCarburante] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[QtaKm] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Percorrenze] ADD CONSTRAINT [PK_dbo_Percorrenze] PRIMARY KEY CLUSTERED  ([IDPercorrenza]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Percorrenze] ADD CONSTRAINT [FK_dbo_Percorrenze_DataPercorrenza] FOREIGN KEY ([DataPercorrenza]) REFERENCES [dbo].[DimData] ([PKData])
GO
ALTER TABLE [dbo].[Percorrenze] ADD CONSTRAINT [FK_dbo_Percorrenze_IDTipoCarburante] FOREIGN KEY ([IDTipoCarburante]) REFERENCES [dbo].[TipoCarburante] ([IDTipoCarburante])
GO
