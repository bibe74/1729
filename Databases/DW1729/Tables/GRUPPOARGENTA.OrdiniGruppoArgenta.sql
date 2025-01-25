CREATE TABLE [GRUPPOARGENTA].[OrdiniGruppoArgenta]
(
[Gusto] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DataOrdine] [datetime] NULL,
[DataSpedizione] [datetime] NULL,
[DataFattura] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Qta] [int] NULL,
[Prezzo] [decimal] (10, 2) NOT NULL CONSTRAINT [DFT_GRUPPOARGENTA_OrdiniGruppoArgenta_Prezzo] DEFAULT ((0.0))
) ON [PRIMARY]
GO
