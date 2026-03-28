
CREATE VIEW AX2009.REQITEMTABLE_CoperturaArticoliView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	ITEMID,		-- IDArticoloConfigurato
	RECID,		-- PKCoperturaArticoli

	-- Dimensioni
	MININVENTONHAND,		-- CoperturaMinima
	LEADTIMEPURCHASE,		-- LeadTimeAcquisto
	REQGROUPID,		-- IDGruppoCopertura
	INVENTLOCATIONIDREQMAIN,		-- IDMagazzino
	LEADTIMEPURCHASEACTIVE		-- IsLeadTimeAcquistoAttivo

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.REQITEMTABLE;
GO

