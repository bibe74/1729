CREATE TABLE [IRDP].[RaccoltaDatiLotto_Billette] (
    [NumeroLotto]                CHAR (15)        NOT NULL,
    [NumeroBilletta]             SMALLINT         NOT NULL,
    [ID]                         INT              NOT NULL,
    [IDCausaleProduzioneRidotta] SMALLINT         NULL,
    [IDCausaleChiusuraLotto]     SMALLINT         NULL,
    [TimeStartCiclo]             DATETIME         NULL,
    [TimeStart]                  DATETIME         NULL,
    [TimeStop]                   DATETIME         NULL,
    [TimeStopCiclo]              DATETIME         NULL,
    [LunghezzaBarra]             SMALLINT         NULL,
    [LunghezzaBillettaEstrusa]   DECIMAL (28, 12) NULL,
    [CodiceColata]               CHAR (35)        NULL,
    [LunghezzaFondello]          DECIMAL (28, 12) NULL,
    [Campionatura]               BIT              NULL,
    [Elab_Turno]                 SMALLINT         NULL,
    [Elab_TurnoData]             DATE             NULL,
    [Elab_TurnoDataMetra]        DATE             NULL,
    [KgLordiPressa]              DECIMAL (28, 12) NULL,
    [KgEstrusi]                  DECIMAL (28, 12) NULL,
    [Elab_KgNettiTaglio]         DECIMAL (28, 12) NULL,
    [Elab_KgNettiImballo]        DECIMAL (28, 12) NULL,
    [Elab_SecondiFermo]          SMALLINT         NULL
);
GO

ALTER TABLE [IRDP].[RaccoltaDatiLotto_Billette]
    ADD CONSTRAINT [PK_RaccoltaDatiLotto_Billette] PRIMARY KEY CLUSTERED ([NumeroLotto] ASC, [NumeroBilletta] ASC, [ID] ASC);
GO

