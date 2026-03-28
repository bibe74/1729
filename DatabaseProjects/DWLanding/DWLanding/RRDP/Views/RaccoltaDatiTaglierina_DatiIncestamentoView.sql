
CREATE VIEW RRDP.RaccoltaDatiTaglierina_DatiIncestamentoView
AS
SELECT
	-- Chiavi
	NumeroLotto,		-- NumeroLotto
	COALESCE(NumeroCesta, CONVERT(VARCHAR(10), ID)) AS NumeroCesta,		-- NumeroCesta
	ID,		-- PKDatiIncestamento

	-- Dimensioni
	COALESCE(LunghezzaTagliata, 0) AS LunghezzaTagliata,		-- LunghezzaTagliata
	COALESCE(Tipo, '') AS Tipo,		-- Tipo

	-- Misure
	COALESCE(Qta, 0) AS Qta		-- Qta

FROM [SQL2014MRAG\SCADA2014].RaccoltaDatiProduzione.dbo.RaccoltaDatiTaglierina
WHERE NumeroLotto IS NOT NULL;
GO

