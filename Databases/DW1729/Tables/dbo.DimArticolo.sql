CREATE TABLE [dbo].[DimArticolo]
(
[PKArticolo] [tinyint] NOT NULL IDENTITY(1, 1),
[Articolo] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TipoArticolo] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[GruppoPrezzi] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimArticolo] ADD CONSTRAINT [PK_DimArticolo] PRIMARY KEY CLUSTERED  ([PKArticolo]) ON [PRIMARY]
GO
