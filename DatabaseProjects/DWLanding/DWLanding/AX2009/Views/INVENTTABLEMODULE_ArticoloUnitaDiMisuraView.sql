
CREATE VIEW AX2009.INVENTTABLEMODULE_ArticoloUnitaDiMisuraView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	ITEMID,		-- IDArticoloConfigurato
	MODULETYPE,		-- IDTipoModulo [enum ModuleInventPurchSales]
	RECID,		-- PKArticoloUnitaDiMisura

	-- Dimensioni
	UNITID,		-- IDUnitaDiMisura
	PRICE,		-- Prezzo
	PRICEUNIT,		-- UnitaDiPrezzo
	MARKUP,		-- Spese
	PRICEQTY,		-- QtaPrezzo
	NPOSECONDINVENTUNITID,		-- IDSecondaUnitaDiMisura
	NPOSECONDUNITACTIVE		-- IsSecondaUnitaDiMisuraAttiva

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTTABLEMODULE;
GO

