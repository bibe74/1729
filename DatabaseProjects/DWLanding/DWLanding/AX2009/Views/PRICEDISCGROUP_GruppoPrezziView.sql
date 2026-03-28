
CREATE VIEW AX2009.PRICEDISCGROUP_GruppoPrezziView
AS
SELECT
	-- Chiavi
	DATAAREAID,	-- IDAzienda
	MODULE,		-- IDModulo
	GROUPID,	-- IDGruppoPrezzi
	RECID,		-- PKGruppoPrezzi

	-- Dimensioni
	NAME		-- GruppoPrezzi

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.PRICEDISCGROUP
WHERE MODULE = 0;
GO

