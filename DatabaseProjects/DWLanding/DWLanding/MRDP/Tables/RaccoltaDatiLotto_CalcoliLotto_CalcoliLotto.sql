CREATE TABLE [MRDP].[RaccoltaDatiLotto_CalcoliLotto_CalcoliLotto] (
    [ID]                        BIGINT           NOT NULL,
    [DiametroBilletta]          DECIMAL (28, 12) NOT NULL,
    [PesoProfiloAlMetroMatrice] DECIMAL (28, 12) NOT NULL,
    [BarreTagliate]             SMALLINT         NOT NULL,
    [NumeroCeste]               SMALLINT         NOT NULL,
    [KgImballati]               DECIMAL (28, 12) NOT NULL,
    [KgImballatiAXPesa]         DECIMAL (28, 12) NOT NULL,
    [KgImballatiAXTeorico]      DECIMAL (28, 12) NOT NULL
);
GO

ALTER TABLE [MRDP].[RaccoltaDatiLotto_CalcoliLotto_CalcoliLotto]
    ADD CONSTRAINT [PK_RaccoltaDatiLotto_CalcoliLotto_CalcoliLotto] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

