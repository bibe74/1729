
CREATE VIEW AX2009.ADDRESSSTATE_RegioneView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	COUNTRYREGIONID,		-- IDNazione
	STATEID,		-- IDRegione
	RECID,		-- PKRegione

	-- Dimensioni
	NAME		-- Regione

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.ADDRESSSTATE;
GO

