
CREATE VIEW RRDP.CausaliChiusuraLotto_CausaleChiusuraLottoView
AS
SELECT
	-- Chiavi
	ID,		-- PKCausaleChiusuraLotto

	-- Dimensioni
	COALESCE(Descrizione, '') AS Descrizione,		-- CausaleChiusuraLotto
	COALESCE(EsitoProduzione, '') AS EsitoProduzione		-- EsitoProduzione

FROM [SQL2014MRAG\SCADA2014].RaccoltaDatiProduzione.dbo.CausaliChiusuraLotto;
GO

