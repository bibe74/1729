
CREATE VIEW AX2009.COMMISSIONSALESGROUP_GruppoVenditeView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	GROUPID,		-- IDGruppoVendite
	RECID,		-- PKGruppoVendite

	-- Dimensioni
	NAME		-- GruppoVendite

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.COMMISSIONSALESGROUP;
GO

