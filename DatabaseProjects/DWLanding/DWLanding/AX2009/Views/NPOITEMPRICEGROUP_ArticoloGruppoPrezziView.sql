
CREATE VIEW AX2009.NPOITEMPRICEGROUP_ArticoloGruppoPrezziView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	ITEMID,		-- IDArticoloConfigurato
	RECID,		-- PKArticoloGruppoPrezzi

	-- Dimensioni
	ITEMPRICEGROUPID,		-- IDGruppoPrezzi
	REVITEMID		-- IDArticoloRicavo

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOITEMPRICEGROUP;
GO

