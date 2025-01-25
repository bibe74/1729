CREATE TABLE [GRUPPOARGENTA].[Offerta]
(
[IDOfferta] [nvarchar] (17) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Offerta] [nvarchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HasCanoneAnnuo] [int] NOT NULL,
[ImportoCanoneAnnuo] [numeric] (3, 1) NOT NULL,
[HasCostoAccessori] [int] NOT NULL,
[Prezzo037] [numeric] (2, 2) NOT NULL,
[Prezzo039] [numeric] (2, 2) NOT NULL,
[Prezzo045] [numeric] (2, 2) NOT NULL
) ON [PRIMARY]
GO
