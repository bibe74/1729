
CREATE VIEW AX2009.INVENTITEMLOCATION_ArticoloDimensioneInventarialeView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	ITEMID,			-- IDArticoloConfigurato
	INVENTDIMID,	-- IDDimensioneInventariale
	RECID,			-- PKArticoloDimensioneInventariale

	-- Dimensioni
	NPODLVAREAID	-- IDAreaPrelievo

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTITEMLOCATION
WHERE INVENTDIMID <> N'AllBlank';
GO

