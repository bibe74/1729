CREATE TABLE [IRDP].[CausaliChiusuraLotto_CausaleChiusuraLotto] (
    [ID]              SMALLINT     NOT NULL,
    [Descrizione]     VARCHAR (50) NULL,
    [EsitoProduzione] VARCHAR (50) NULL
);
GO

ALTER TABLE [IRDP].[CausaliChiusuraLotto_CausaleChiusuraLotto]
    ADD CONSTRAINT [PK_CausaliChiusuraLotto_CausaleChiusuraLotto] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

