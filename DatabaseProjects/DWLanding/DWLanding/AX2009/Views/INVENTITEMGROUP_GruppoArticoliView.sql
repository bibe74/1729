
CREATE VIEW AX2009.INVENTITEMGROUP_GruppoArticoliView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	ITEMGROUPID,		-- IDGruppoArticoli
	RECID,		-- PKGruppoArticoli

	-- Dimensioni
	NAME		-- GruppoArticoli

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTITEMGROUP;
GO

