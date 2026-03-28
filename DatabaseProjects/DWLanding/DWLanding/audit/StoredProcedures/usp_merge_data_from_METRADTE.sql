
/**
 * @stored_procedure audit.usp_merge_data_from_METRADTE
 * @description Script per caricamento tabelle OLAP - schema METRADTE
*/

CREATE   PROCEDURE audit.usp_merge_data_from_METRADTE
AS
BEGIN

SET NOCOUNT ON;

DECLARE @PKEventSubElaboration BIGINT;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_METRADTE: Inizio', @PKEventSubElaboration;

EXEC METRADTE.usp_Merge_MetraDTE_AnagraficaAgentiTecnici_AgenteTecnico;
EXEC METRADTE.usp_Merge_MetraDTE_AnagraficaUtenti_Utente;
EXEC METRADTE.usp_Merge_MetraDTE_Attivita_AttivitaProgrammata;
EXEC METRADTE.usp_Merge_MetraDTE_AttivitaPreliminari_AttivitaPreliminare;
EXEC METRADTE.usp_Merge_MetraDTE_AttivitaPreliminariLogModifiche_Modifiche;
EXEC METRADTE.usp_Merge_MetraDTE_attivitaProgrammateImpegniEffettivi_ImpegniEffettivi;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_METRADTE: Fine', @PKEventSubElaboration;

END;
GO

