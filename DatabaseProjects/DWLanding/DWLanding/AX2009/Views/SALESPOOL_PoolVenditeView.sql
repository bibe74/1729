
CREATE VIEW AX2009.SALESPOOL_PoolVenditeView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	SALESPOOLID,		-- IDPoolVendite
	RECID,		-- PKPoolVendite

	-- Dimensioni
	NAME		-- PoolVendite

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.SALESPOOL;
GO

