
CREATE VIEW AX2009.BOM_VersioneDBA_RigaView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	BOMID,		-- IDVersioneDBA
	LINENUM,		-- NumeroRiga
	RECID,		-- PKVersioneDBA_Riga

	-- Dimensioni
	ITEMID,		-- IDArticoloConfigurato
	BOMQTY,		-- Qta
	FROMDATE,		-- DataInizio
	TODATE,		-- DataFine
	INVENTDIMID		-- IDDimensioneInventariale

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.BOM;
GO

