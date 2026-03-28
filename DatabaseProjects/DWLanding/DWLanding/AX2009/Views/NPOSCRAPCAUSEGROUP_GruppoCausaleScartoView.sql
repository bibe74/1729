
CREATE VIEW AX2009.NPOSCRAPCAUSEGROUP_GruppoCausaleScartoView
AS
SELECT
	-- Chiavi
	SCRAPCAUSEGROUPID,		-- IDGruppoCausaleScarto
	RECID,		-- PKGruppoCausaleScarto

	-- Dimensioni
	NAME		-- GruppoCausaleScarto

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOSCRAPCAUSEGROUP;
GO

