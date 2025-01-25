CREATE TABLE [ZAFIRA].[SpeseCarburanteZafira]
(
[Data] [date] NULL,
[KmTotali] [decimal] (28, 12) NULL,
[TipoCarburante] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LocalitaDistributore] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EuroMetano] [decimal] (28, 12) NULL,
[EuroKgMetano] [decimal] (28, 12) NULL,
[EuroBenzina] [decimal] (28, 12) NULL,
[EuroLitroBenzina] [decimal] (28, 12) NULL
) ON [PRIMARY]
GO
