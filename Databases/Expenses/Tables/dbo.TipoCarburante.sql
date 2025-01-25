CREATE TABLE [dbo].[TipoCarburante]
(
[IDTipoCarburante] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TipoCarburante] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IDUnitaDiMisura] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TipoCarburante] ADD CONSTRAINT [PK_dbo_TipoCarburante] PRIMARY KEY CLUSTERED  ([IDTipoCarburante]) ON [PRIMARY]
GO
