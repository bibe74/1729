
CREATE VIEW AX2009.NPOREVENUEGROUP_GruppoRicaviView
AS
SELECT
	-- Chiavi
	REVENUEGROUPID,		-- IDGruppoRicavi
	RECID,		-- PKGruppoRicavi

	-- Dimensioni
	NAME		-- GruppoRicavi

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOREVENUEGROUP;
GO

