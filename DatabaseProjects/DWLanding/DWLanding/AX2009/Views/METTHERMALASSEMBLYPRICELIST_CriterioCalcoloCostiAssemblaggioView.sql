
CREATE VIEW AX2009.METTHERMALASSEMBLYPRICELIST_CriterioCalcoloCostiAssemblaggioView
AS
SELECT
	-- Chiavi
    DATAAREAID,     -- IDAzienda
	MNGTYPE,		-- IDTipoGestione [enum NPOMngTypeId]
	FROMDATE,		-- DataInizioValidita
    RECID,          -- PKCriterioCalcoloCostiAssemblaggio

	-- Misure
	AMOUNT          -- ImportoUnitario

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.METTHERMALASSEMBLYPRICELIST;
GO

