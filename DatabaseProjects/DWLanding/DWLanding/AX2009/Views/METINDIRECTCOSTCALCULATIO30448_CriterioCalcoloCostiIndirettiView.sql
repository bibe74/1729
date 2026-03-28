
CREATE VIEW AX2009.METINDIRECTCOSTCALCULATIO30448_CriterioCalcoloCostiIndirettiView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	SECTORTYPE,		-- IDTipoSettore [enum NPOSectorTypeId]
	MNGTYPE,		-- IDTipoGestione [enum NPOMngTypeId]
	INVENTITEMTYPE,		-- IDTipoArticolo
	FROMDATE,		-- DataInizioValidita
	FILTERCODE,		-- IDGruppo [enum TableGroupAll]
	CUSTACCOUNT,		-- IDCliente
	RECID,		-- PKCriterioCalcoloCostiIndiretti

	-- Dimensioni
	COSTCALCULATIONTYPE,		-- IDTipoCalcoloCosti [enum METCostCalculationTypeId]
	PERCENT_		-- PercentualeCosti

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.METINDIRECTCOSTCALCULATIO30448;
GO

