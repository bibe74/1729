
CREATE VIEW IRDP.CausaliChiusuraLotto_CausaleChiusuraLottoView
AS
SELECT
	-- Chiavi
	ID,		-- PKCausaleChiusuraLotto

	-- Dimensioni
	Descrizione,		-- CausaleChiusuraLotto
	EsitoProduzione		-- EsitoProduzione

FROM [SQL2012IMET\SCADA2012].Metra_RaccoltaDatiProduzione.dbo.CausaliChiusuraLotto;
GO

