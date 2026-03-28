
CREATE VIEW AX2009.REQGROUP_GruppoCoperturaView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	REQGROUPID,		-- IDGruppoCopertura
	RECID,		-- PKGruppoCopertura

	-- Dimensioni
	NAME,		-- GruppoCopertura
	NPOSTOCKMANAGEDITEM		-- IsGestitoAMagazzino

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.REQGROUP;
GO

