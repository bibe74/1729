CREATE TABLE [IRDP].[RaccoltaDatiLotto_Lotti_Lotti] (
    [NumeroLotto]                  CHAR (15)        NOT NULL,
    [ID]                           INT              NOT NULL,
    [IDPressa]                     CHAR (3)         NULL,
    [IDCausaleChiusuraLotto]       SMALLINT         NULL,
    [CodiceMatrice]                VARCHAR (20)     NULL,
    [NumeroMatrice]                SMALLINT         NULL,
    [StatoMatrice]                 CHAR (1)         NULL,
    [CodiceCliente]                NVARCHAR (40)    NULL,
    [ChiusuraLotto]                BIT              NULL,
    [ChiusuraLottoDataOra]         DATETIME         NULL,
    [ChiusuraIncestamento]         BIT              NULL,
    [ChiusuraIncestamentoDataOra]  DATETIME         NULL,
    [PrimaBilletta]                SMALLINT         NULL,
    [PesoProfiloAlMetroScada]      DECIMAL (28, 12) NULL,
    [PesoProfiloAlMetroAnagrafica] DECIMAL (28, 12) NULL,
    [PesoProfiloAlMetroCollaudo]   DECIMAL (28, 12) NULL,
    [PesoProfiloAlMetro]           DECIMAL (28, 12) NULL,
    [TimeStart]                    DATETIME         NULL,
    [TimeStop]                     DATETIME         NULL,
    [Campionatura]                 BIT              NULL,
    [Lega]                         NVARCHAR (100)   NULL,
    [LegaTrattamento]              NVARCHAR (100)   NULL,
    [Elab_Riconciliato]            BIT              NULL,
    [ProdUtilizzoGrafite]          BIT              NULL,
    [KgLordiPressa]                DECIMAL (28, 12) NULL,
    [KgScartoCesoia]               DECIMAL (28, 12) NULL,
    [KgEstrusi]                    DECIMAL (28, 12) NULL,
    [KgTagliati]                   DECIMAL (28, 12) NULL,
    [KgImballati]                  DECIMAL (28, 12) NULL,
    [KgScartoImballo]              DECIMAL (28, 12) NULL
);
GO

ALTER TABLE [IRDP].[RaccoltaDatiLotto_Lotti_Lotti]
    ADD CONSTRAINT [PK_RaccoltaDatiLotto_Lotti_Lotti] PRIMARY KEY CLUSTERED ([NumeroLotto] ASC);
GO

