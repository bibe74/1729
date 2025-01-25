CREATE TABLE [Staging].[OffertaPrezzo]
(
[IDOfferta] [nvarchar] (17) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Offerta] [nvarchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IDGusto] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Gusto] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Prezzo] [decimal] (10, 2) NULL
) ON [PRIMARY]
GO
