
CREATE VIEW RRDP.ScartiCesoia_ScartiCesoiaView
AS
SELECT
	-- Chiavi
	NumeroLotto,		-- NumeroLotto
	ID,		-- PKScartiCesoia

	-- Dimensioni
	TimeStamp,		-- DataOraScartoCesoia
	COALESCE(ScartoManuale, 0) AS ScartoManuale,		-- IsScartoManuale

	-- Misure
	CONVERT(DECIMAL(28, 12), COALESCE(KgScartoCesoia, 0.0)) AS KgScartoCesoia		-- KgScartoCesoia

FROM [SQL2014MRAG\SCADA2014].RaccoltaDatiProduzione.dbo.ScartiCesoia
WHERE TimeStamp IS NOT NULL;
GO

