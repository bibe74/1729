
CREATE VIEW AX2009.INVENTDIM_DimensioneInventarialeView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	INVENTDIMID,		-- IDDimensioneInventariale
	RECID,		-- PKDimensioneInventariale

	-- Dimensioni
	WMSLOCATIONID,		-- IDUbicazione
	WMSPALLETID,		-- IDPallet
	INVENTLOCATIONID,		-- IDMagazzino
	INVENTSIZEID,		-- Dimensione
	INVENTCOLORID,		-- Colore
	INVENTSITEID		-- IDSito

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTDIM;
GO

