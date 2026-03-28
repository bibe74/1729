CREATE TABLE [IRDP].[RaccoltaDatiTaglierina_DatiIncestamento] (
    [ID]                INT          NOT NULL,
    [LunghezzaTagliata] SMALLINT     NULL,
    [NumeroLotto]       CHAR (15)    NULL,
    [NumeroCesta]       VARCHAR (10) NULL,
    [Tipo]              CHAR (1)     NULL,
    [Qta]               SMALLINT     NULL
);
GO

ALTER TABLE [IRDP].[RaccoltaDatiTaglierina_DatiIncestamento]
    ADD CONSTRAINT [PK_RaccoltaDatiTaglierina_DatiIncestamento] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

