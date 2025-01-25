CREATE TABLE [XMLCodifiche].[Natura]
(
[IDNatura] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Natura] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [XMLCodifiche].[Natura] ADD CONSTRAINT [PK_XMLCodifiche_Natura] PRIMARY KEY CLUSTERED  ([IDNatura]) ON [PRIMARY]
GO
