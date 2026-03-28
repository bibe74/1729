
CREATE VIEW AX2009.PURCHPOOL_PoolAcquistiView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	PURCHPOOLID,		-- IDPoolAcquisti
	RECID,		-- PKPoolAcquisti

	-- Dimensioni
	NAME		-- PoolAcquisti

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.PURCHPOOL;
GO

