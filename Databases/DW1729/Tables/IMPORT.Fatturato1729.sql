CREATE TABLE [IMPORT].[Fatturato1729]
(
[Data fattura] [datetime] NULL,
[Progressivo] [float] NULL,
[Cliente] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Categoria] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Imponibile prestazioni] [money] NULL,
[Anno] [float] NULL,
[Numero fattura] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rivalsa parziale INPS] [money] NULL,
[Totale imponibile] [money] NULL,
[% IVA] [float] NULL,
[Importo IVA] [money] NULL,
[Totale fattura] [money] NULL,
[Ritenuta acconto] [money] NULL,
[Netto da versare] [money] NULL,
[Pagato] [money] NULL,
[IsSaldata] [bit] NOT NULL,
[MeseDescrizione] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
