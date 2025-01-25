CREATE TABLE [dbo].[province-inail]
(
[Provincia] [int] NOT NULL,
[CodSiglaProvincia] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DescrProvincia] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CodCittaMetropolitana] [int] NOT NULL,
[CodRegione] [int] NOT NULL,
[DescrRegione] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CodMacroregione] [int] NOT NULL,
[DescrMacroregione] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CodNazione] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DescrNazione] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DataInizioValidita] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DataFineValidita] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[province-inail] ADD CONSTRAINT [PK_province-inail] PRIMARY KEY CLUSTERED  ([CodSiglaProvincia]) ON [PRIMARY]
GO
