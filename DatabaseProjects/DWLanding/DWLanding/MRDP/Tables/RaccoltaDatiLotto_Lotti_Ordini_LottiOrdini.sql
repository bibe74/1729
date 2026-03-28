CREATE TABLE [MRDP].[RaccoltaDatiLotto_Lotti_Ordini_LottiOrdini] (
    [NumeroLotto]  CHAR (15) NOT NULL,
    [NumeroOrdine] CHAR (20) NOT NULL,
    [ID]           INT       NOT NULL
);
GO

ALTER TABLE [MRDP].[RaccoltaDatiLotto_Lotti_Ordini_LottiOrdini]
    ADD CONSTRAINT [PK_RaccoltaDatiLotto_Lotti_Ordini_LottiOrdini] PRIMARY KEY CLUSTERED ([NumeroLotto] ASC, [NumeroOrdine] ASC);
GO

