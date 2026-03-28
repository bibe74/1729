
CREATE VIEW AX2009.BOMCALCGROUP_GruppoCalcoloDBAView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	CALCGROUPID,		-- IDGruppoCalcoloDBA
	RECID,		-- PKGruppoCalcoloDBA

	-- Dimensioni
	NAME,		-- GruppoCalcoloDBA
	STOPEXPLODEPRICE		-- IsInterrompiEsplosioneDBA

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.BOMCALCGROUP;
GO

