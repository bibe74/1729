
CREATE VIEW AX2009.EXCHRATES_TassiDiCambioView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	CURRENCYCODE,		-- IDValuta
	FROMDATE,		-- DataInizioValidita
	RECID,		-- PKTassiDiCambio

	-- Dimensioni
	TODATE,		-- DataFineValidita

	-- Misure
	EXCHRATE		-- TassoDiCambio

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.EXCHRATES;
GO

