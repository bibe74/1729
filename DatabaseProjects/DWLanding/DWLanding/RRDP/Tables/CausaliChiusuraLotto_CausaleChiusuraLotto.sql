CREATE TABLE [RRDP].[CausaliChiusuraLotto_CausaleChiusuraLotto] (
    [ID]              SMALLINT     NOT NULL,
    [Descrizione]     VARCHAR (50) NOT NULL,
    [EsitoProduzione] VARCHAR (50) NOT NULL
);
GO

ALTER TABLE [RRDP].[CausaliChiusuraLotto_CausaleChiusuraLotto]
    ADD CONSTRAINT [PK_CausaliChiusuraLotto_CausaleChiusuraLotto] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

