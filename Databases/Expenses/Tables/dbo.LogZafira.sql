CREATE TABLE [dbo].[LogZafira]
(
[Data] [datetime] NULL,
[KmTotali] [float] NULL,
[IDTipoCarburante] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CodiceDistributore] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LocalitaDistributore] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EuroMetano] [float] NULL,
[PrezzoMetano] [float] NULL,
[KgMetano] [float] NULL,
[KmMetano] [float] NULL,
[NoteMetano] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EuroBenzina] [float] NULL,
[PrezzoBenzina] [float] NULL,
[LitriBenzina] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[KmBenzina] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NoteBenzina] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[KmMetanoInt] [float] NULL,
[KmBenzinaInt] [float] NULL
) ON [PRIMARY]
GO
