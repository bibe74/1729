CREATE TABLE [Staging].[T_SpeseCarburanteZafira]
(
[PKSpeseCarburanteZafira] [int] NOT NULL IDENTITY(1, 1),
[rn] [bigint] NULL,
[Data] [date] NULL,
[KmMetano] [decimal] (29, 12) NULL,
[KmBenzina] [decimal] (29, 12) NULL,
[LocalitaDistributore] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EuroMetano] [decimal] (28, 12) NULL,
[EuroKgMetano] [decimal] (28, 12) NULL,
[EuroBenzina] [decimal] (28, 12) NULL,
[EuroLitroBenzina] [decimal] (28, 12) NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[T_SpeseCarburanteZafira] ADD CONSTRAINT [PK_staging_T_SpeseCarburanteZafira] PRIMARY KEY CLUSTERED  ([PKSpeseCarburanteZafira]) ON [PRIMARY]
GO
