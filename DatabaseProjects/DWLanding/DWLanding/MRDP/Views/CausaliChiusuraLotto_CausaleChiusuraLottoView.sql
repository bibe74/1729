
CREATE VIEW MRDP.CausaliChiusuraLotto_CausaleChiusuraLottoView
AS
SELECT
	-- Chiavi
	ID,		-- PKCausaleChiusuraLotto

	-- Dimensioni
	COALESCE(Descrizione, '') AS Descrizione,		-- CausaleChiusuraLotto
	COALESCE(EsitoProduzione, '') AS EsitoProduzione		-- EsitoProduzione

FROM [SQL2014\SCADA2014].RaccoltaDatiProduzione.dbo.CausaliChiusuraLotto;
GO

