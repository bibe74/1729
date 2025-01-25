CREATE TABLE [dbo].[Distributore]
(
[IDDistributore] [int] NOT NULL IDENTITY(1, 1),
[Distributore] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Localita] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Provincia] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Regione] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Nazione] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsAutostrada] [bit] NOT NULL CONSTRAINT [DFT_dbo_Distributore_IsAutostrada] DEFAULT ((0)),
[Autostrada] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AreaServizio] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Distributore] ADD CONSTRAINT [PK_dbo_Distributore] PRIMARY KEY CLUSTERED  ([IDDistributore]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_dbo_Distributore_Distributore] ON [dbo].[Distributore] ([Distributore]) ON [PRIMARY]
GO
