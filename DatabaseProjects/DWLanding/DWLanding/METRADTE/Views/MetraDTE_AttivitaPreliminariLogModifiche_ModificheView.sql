
CREATE VIEW METRADTE.MetraDTE_AttivitaPreliminariLogModifiche_ModificheView
AS
SELECT
	-- Chiavi
	ID,  -- IDModifiche

	-- Dimensioni
	COALESCE(IDSchedaPreliminare, -1) AS IDSchedaPreliminare,  -- IDSchedaPreliminare
	CONVERT(DATE, dataModifica) AS dataModifica,  -- DataModifica
	COALESCE(IDUtenteModifica, -1) AS IDUtenteModifica,  -- IDUtenteModifica

	-- Misure
	COALESCE(valoreCampo, 0.0) AS valoreCampo -- OreStimateTotali

FROM [SQL2014\DB2014].wwwMetraIt.dbo.MetraDTE_AttivitaPreliminariLogModifiche
WHERE nomeCampo = N'impegnoPrevisto';
GO

