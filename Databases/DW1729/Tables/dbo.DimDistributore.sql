CREATE TABLE [dbo].[DimDistributore]
(
[PKDistributore] [int] NOT NULL IDENTITY(1, 1),
[Localita] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Provincia] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Nazione] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimDistributore] ADD CONSTRAINT [PK_dbo_DimDistributore] PRIMARY KEY CLUSTERED  ([PKDistributore]) ON [PRIMARY]
GO
