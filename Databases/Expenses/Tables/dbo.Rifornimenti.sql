CREATE TABLE [dbo].[Rifornimenti]
(
[IDRifornimento] [int] NOT NULL IDENTITY(1, 1),
[DataRifornimento] [date] NOT NULL,
[IDDistributore] [int] NOT NULL,
[IDTipoCarburante] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ImportoEuro] [decimal] (10, 5) NOT NULL,
[PrezzoUnitario] [decimal] (10, 5) NOT NULL,
[QtaCarburante] [decimal] (10, 5) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Rifornimenti] ADD CONSTRAINT [PK_dbo_Rifornimenti] PRIMARY KEY CLUSTERED  ([IDRifornimento]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Rifornimenti] ADD CONSTRAINT [FK_dbo_Rifornimenti_IDDistributore] FOREIGN KEY ([IDDistributore]) REFERENCES [dbo].[Distributore] ([IDDistributore])
GO
ALTER TABLE [dbo].[Rifornimenti] ADD CONSTRAINT [FK_dbo_Rifornimenti_IDTipoCarburante] FOREIGN KEY ([IDTipoCarburante]) REFERENCES [dbo].[TipoCarburante] ([IDTipoCarburante])
GO
