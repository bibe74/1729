CREATE TABLE [IMETPQ].[FogliodiproduzionegiornalieraFoall_DatiColata] (
    [N° progressivo]    INT              NOT NULL,
    [Colata]            NVARCHAR (20)    NOT NULL,
    [DiametroBilletta]  DECIMAL (28, 12) NULL,
    [Lega]              NVARCHAR (20)    NULL,
    [LunghezzaBilletta] DECIMAL (28, 12) NULL
);
GO

ALTER TABLE [IMETPQ].[FogliodiproduzionegiornalieraFoall_DatiColata]
    ADD CONSTRAINT [PK_FogliodiproduzionegiornalieraFoall_DatiColata] PRIMARY KEY CLUSTERED ([N° progressivo] ASC) WITH (FILLFACTOR = 100);
GO

