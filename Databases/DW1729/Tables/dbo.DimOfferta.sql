CREATE TABLE [dbo].[DimOfferta]
(
[PKOfferta] [tinyint] NOT NULL IDENTITY(1, 1),
[IDOfferta] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Offerta] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HasCanoneAnnuo] [bit] NOT NULL,
[ImportoCanoneAnnuo] [decimal] (10, 2) NOT NULL,
[HasCostoAccessori] [bit] NOT NULL,
[Prezzo037] [decimal] (5, 2) NOT NULL,
[Prezzo039] [decimal] (5, 2) NOT NULL,
[Prezzo045] [decimal] (5, 2) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimOfferta] ADD CONSTRAINT [PK_DimOfferta] PRIMARY KEY CLUSTERED  ([PKOfferta]) ON [PRIMARY]
GO
