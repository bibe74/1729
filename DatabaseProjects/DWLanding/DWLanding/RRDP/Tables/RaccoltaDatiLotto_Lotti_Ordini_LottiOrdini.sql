CREATE TABLE [RRDP].[RaccoltaDatiLotto_Lotti_Ordini_LottiOrdini] (
    [NumeroLotto]  CHAR (15) NOT NULL,
    [NumeroOrdine] CHAR (20) NOT NULL,
    [ID]           INT       NOT NULL
);
GO

ALTER TABLE [RRDP].[RaccoltaDatiLotto_Lotti_Ordini_LottiOrdini]
    ADD CONSTRAINT [PK_RaccoltaDatiLotto_Lotti_Ordini_LottiOrdini] PRIMARY KEY CLUSTERED ([NumeroLotto] ASC, [NumeroOrdine] ASC);
GO

