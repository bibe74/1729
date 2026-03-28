CREATE TABLE [METRAPQ].[FogliodiproduzionegiornalieraFoall_DatiColata] (
    [N° progressivo]      INT              NOT NULL,
    [Colata]              NVARCHAR (20)    NOT NULL,
    [DiametroBilletta]    DECIMAL (28, 12) NOT NULL,
    [Lega]                NVARCHAR (20)    NULL,
    [LunghezzaBilletta]   DECIMAL (28, 12) NULL,
    [PesoTeoricoBilletta] DECIMAL (28, 12) NOT NULL
);
GO

ALTER TABLE [METRAPQ].[FogliodiproduzionegiornalieraFoall_DatiColata]
    ADD CONSTRAINT [PK_FogliodiproduzionegiornalieraFoall_DatiColata] PRIMARY KEY CLUSTERED ([N° progressivo] ASC) WITH (FILLFACTOR = 100);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_METRAPQ_FogliodiproduzionegiornalieraFoall_DatiColata_Colata]
    ON [METRAPQ].[FogliodiproduzionegiornalieraFoall_DatiColata]([Colata] ASC) WITH (FILLFACTOR = 100);
GO

