
CREATE VIEW AX2009.VENDGROUP_FornitoreGruppoView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	VENDGROUP,		-- IDFornitoreGruppo
	RECID,		-- PKFornitoreGruppo

	-- Dimensioni
	NAME		-- FornitoreGruppo

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.VENDGROUP;
GO

