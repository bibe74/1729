CREATE TABLE [MRDP].[RaccoltaDatiLotto_Billette] (
    [NumeroLotto]                CHAR (15)        NOT NULL,
    [NumeroBilletta]             SMALLINT         NOT NULL,
    [ID]                         INT              NOT NULL,
    [IDCausaleProduzioneRidotta] SMALLINT         NOT NULL,
    [IDCausaleChiusuraLotto]     SMALLINT         NOT NULL,
    [ChiusuraLotto]              SMALLINT         NOT NULL,
    [CodiceMatrice]              CHAR (20)        NOT NULL,
    [NumeroMatrice]              SMALLINT         NOT NULL,
    [TimeStartCiclo]             DATETIME         NOT NULL,
    [TimeStart]                  DATETIME         NOT NULL,
    [TimeStop]                   DATETIME         NOT NULL,
    [TimeStopCiclo]              DATETIME         NOT NULL,
    [LunghezzaBarra]             SMALLINT         NOT NULL,
    [LunghezzaBillettaEstrusa]   DECIMAL (28, 12) NOT NULL,
    [CodiceColata]               CHAR (35)        NOT NULL,
    [PesoProfiloAlMetro]         DECIMAL (28, 12) NOT NULL,
    [LunghezzaFondello]          DECIMAL (28, 12) NOT NULL,
    [KgLordiPressa]              DECIMAL (28, 12) NOT NULL,
    [KgEstrusi]                  DECIMAL (28, 12) NOT NULL,
    [SecondiEstrusioneNetti]     SMALLINT         NOT NULL
);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_MRDP_RaccoltaDatiLotto_Billette_ID]
    ON [MRDP].[RaccoltaDatiLotto_Billette]([ID] ASC);
GO

ALTER TABLE [MRDP].[RaccoltaDatiLotto_Billette]
    ADD CONSTRAINT [PK_RaccoltaDatiLotto_Billette] PRIMARY KEY CLUSTERED ([NumeroLotto] ASC, [NumeroBilletta] ASC, [ID] ASC);
GO

