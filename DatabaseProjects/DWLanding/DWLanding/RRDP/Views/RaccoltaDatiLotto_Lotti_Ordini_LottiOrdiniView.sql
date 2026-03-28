
CREATE VIEW RRDP.RaccoltaDatiLotto_Lotti_Ordini_LottiOrdiniView
AS
SELECT
	-- Chiavi
	NumeroLotto,		-- NumeroLotto
	NumeroOrdine,		-- NumeroOrdine
	ID		-- ID

FROM [SQL2014MRAG\SCADA2014].RaccoltaDatiProduzione.dbo.RaccoltaDatiLotto_Lotti_Ordini;
GO

