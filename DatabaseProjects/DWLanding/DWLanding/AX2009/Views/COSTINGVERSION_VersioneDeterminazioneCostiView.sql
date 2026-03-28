
CREATE VIEW AX2009.COSTINGVERSION_VersioneDeterminazioneCostiView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	VERSIONID,		-- IDVersioneDeterminazioneCosti
	RECID,		-- PKVersioneDeterminazioneCosti

	-- Dimensioni
	NAME,		-- VersioneDeterminazioneCosti
	LASTUPDATE,		-- DataUltimoAggiornamento
	LASTACTIVATION		-- DataUltimaAttivazione

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.COSTINGVERSION;
GO

