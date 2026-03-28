
CREATE VIEW AX2009.DLVTERM_TerminiConsegnaView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	CODE,		-- IDTerminiConsegna
	RECID,		-- PKTerminiConsegna

	-- Dimensioni
	TXT		-- TerminiConsegna

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.DLVTERM;
GO

