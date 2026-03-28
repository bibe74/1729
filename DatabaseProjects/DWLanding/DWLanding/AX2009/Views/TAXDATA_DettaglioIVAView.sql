
CREATE VIEW AX2009.TAXDATA_DettaglioIVAView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	TAXCODE,		-- IDCodiceIVA
	TAXFROMDATE,		-- DataInizioValidita
	TAXTODATE,		-- DataFineValidita
	RECID,		-- PKDettaglioIVA

	-- Dimensioni
	VATEXEMPTPCT		-- PercentualeIndetraibilita

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.TAXDATA;
GO

