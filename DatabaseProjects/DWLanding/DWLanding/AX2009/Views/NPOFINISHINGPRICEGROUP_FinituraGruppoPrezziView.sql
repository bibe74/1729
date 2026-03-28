
CREATE VIEW AX2009.NPOFINISHINGPRICEGROUP_FinituraGruppoPrezziView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	PBAFINISHINGID,		-- IDFinitura
	RECID,		-- PKFinituraGruppoPrezzi

	-- Dimensioni
	ITEMPRICEGROUPID,		-- IDGruppoPrezzi
	REVITEMID,		-- IDArticoloRicavo
	ITEMTYPE,		-- IDTipoArticolo
	NCEREFERENCEITEMID		-- IDArticoloConfigurato

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOFINISHINGPRICEGROUP;
GO

