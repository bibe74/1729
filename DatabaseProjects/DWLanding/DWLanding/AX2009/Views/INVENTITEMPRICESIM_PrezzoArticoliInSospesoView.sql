
CREATE VIEW AX2009.INVENTITEMPRICESIM_PrezzoArticoliInSospesoView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	ITEMID,		-- IDArticoloConfigurato
	VERSIONID,		-- IDVersione
	RECID,		-- PKPrezzoArticoliInSospeso

	-- Dimensioni
	FROMDATE,		-- DataAttivazione
	PRICETYPE,		-- IDTipoPrezzo [enum CostingVersionPriceType]
	INVENTDIMID,		-- IDDimensioneInventariale
	PRICEUNIT,		-- UnitaDiPrezzo
	PRICECALCID,		-- IDCalcoloDBA
	UNITID,		-- IDUnitaDiMisura
	PRICEALLOCATEMARKUP,		-- IsIncludiInPrezzoUnitario

	-- Misure
	PRICE,		-- Prezzo
	PRICEQTY,		-- QtaPrezzo
	MARKUP		-- SpeseVarie

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTITEMPRICESIM;
GO

