
CREATE PROCEDURE METRADTE.usp_Merge_MetraDTE_AttivitaPreliminariLogModifiche_Modifiche
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'METRADTE.MetraDTE_AttivitaPreliminariLogModifiche_Modifiche', N'U') IS NULL
BEGIN
 EXEC METRADTE.usp_Create_MetraDTE_AttivitaPreliminariLogModifiche_Modifiche;
 EXEC METRADTE.usp_AddIndexes_MetraDTE_AttivitaPreliminariLogModifiche_Modifiche;
END;

MERGE INTO METRADTE.MetraDTE_AttivitaPreliminariLogModifiche_Modifiche AS TGT
USING METRADTE.MetraDTE_AttivitaPreliminariLogModifiche_ModificheView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.IDSchedaPreliminare <> SRC.IDSchedaPreliminare OR TGT.dataModifica <> SRC.dataModifica OR TGT.IDUtenteModifica <> SRC.IDUtenteModifica OR TGT.valoreCampo <> SRC.valoreCampo)
  THEN UPDATE SET TGT.IDSchedaPreliminare = SRC.IDSchedaPreliminare, TGT.dataModifica = SRC.dataModifica, TGT.IDUtenteModifica = SRC.IDUtenteModifica, TGT.valoreCampo = SRC.valoreCampo
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, IDSchedaPreliminare, dataModifica, IDUtenteModifica, valoreCampo)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
 CURRENT_TIMESTAMP AS merge_datetime,
 $action AS merge_action,
 'METRADTE.MetraDTE_AttivitaPreliminariLogModifiche_Modifiche' AS full_olap_table_name,
 'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

