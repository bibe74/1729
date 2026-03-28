
CREATE VIEW AX2009.NPOSCRAPCAUSE_CausaleScartoView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	SCRAPCAUSEID,		-- IDCausaleScarto
	RECID,		-- PKCausaleScarto

	-- Dimensioni
	DESCRIPTION,		-- CausaleScarto
	SCRAPCAUSEGROUPID		-- IDGruppoCausaleScarto

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOSCRAPCAUSE;
GO

