
CREATE VIEW AX2009.METPICKINGCOSTCALCULATION30449_CriterioCalcoloCostiPickingView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	INVENTITEMTYPE,		-- IDTipoArticolo
	FROMDATE,		-- DataInizioValidita
	FILTERCODE,		-- IDGruppo [enum TableGroupAll]
	CUSTACCOUNT,		-- IDCliente
	RECID,		-- PKCriterioCalcoloCostiPicking

	-- Dimensioni
	PRICEPERUNIT,		-- PrezzoUnitario
	PRICEPERSECONDUNIT		-- PrezzoUnitarioSecondaUnitaDiMisura

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.METPICKINGCOSTCALCULATION30449;
GO

