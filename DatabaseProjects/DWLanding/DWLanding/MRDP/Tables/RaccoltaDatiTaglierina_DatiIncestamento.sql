CREATE TABLE [MRDP].[RaccoltaDatiTaglierina_DatiIncestamento] (
    [NumeroLotto]       CHAR (15)    NOT NULL,
    [NumeroCesta]       VARCHAR (10) NOT NULL,
    [ID]                INT          NOT NULL,
    [LunghezzaTagliata] SMALLINT     NOT NULL,
    [Tipo]              CHAR (1)     NOT NULL,
    [Qta]               SMALLINT     NOT NULL
);
GO

ALTER TABLE [MRDP].[RaccoltaDatiTaglierina_DatiIncestamento]
    ADD CONSTRAINT [PK_RaccoltaDatiTaglierina_DatiIncestamento] PRIMARY KEY CLUSTERED ([NumeroLotto] ASC, [NumeroCesta] ASC, [ID] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_MRDP_RaccoltaDatiTaglierina_DatiIncestamento_NumeroLotto_NumeroCesta]
    ON [MRDP].[RaccoltaDatiTaglierina_DatiIncestamento]([NumeroLotto] ASC, [NumeroCesta] ASC);
GO

