
CREATE VIEW AX2009.UNIT_UnitaDiMisuraView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	UNITID,		-- IDUnitaDiMisura
	RECID,		-- PKUnitaDiMisura

	-- Dimensioni
	TXT,		-- UnitaDiMisura
	UNITDECIMALS,		-- NumeroDecimali
	NPOTYPEUNITPCS		-- IsTipoPezzo

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.UNIT;
GO

