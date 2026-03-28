
CREATE VIEW AX2009.NPOPRODUCTIONLOT_LottiView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	LOTID,		-- NumeroLotto
	RECID,		-- PKLotti

	-- Dimensioni
	MASTERWRKCTRID,		-- IDPressa
	LINEARKG,		-- PesoAlMetroLineare
	LOTDATE,		-- DataProduzione
	LOTDATETIME		-- DataOraProduzione

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOPRODUCTIONLOT;
GO

