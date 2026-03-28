
CREATE VIEW METRADTE.MetraDTE_attivitaProgrammateImpegniEffettivi_ImpegniEffettiviView
AS
SELECT
	-- Chiavi
	ID,  -- IDImpegniEffettivi

	-- Dimensioni
	COALESCE(IDScheda, -1) AS IDScheda,  -- IDAttivitaProgrammata

	-- Misure
	COALESCE(impegnoEffettivo, 0.0) AS impegnoEffettivo  -- OreImpegnoEffettivo

FROM [SQL2014\DB2014].wwwMetraIt.dbo.MetraDTE_AttivitaProgrammateImpegniEffettivi;
GO

