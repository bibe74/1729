
CREATE PROCEDURE METRADTE.usp_Merge_MetraDTE_attivitaProgrammateImpegniEffettivi_ImpegniEffettivi
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'METRADTE.MetraDTE_attivitaProgrammateImpegniEffettivi_ImpegniEffettivi', N'U') IS NULL
BEGIN
 EXEC METRADTE.usp_Create_MetraDTE_attivitaProgrammateImpegniEffettivi_ImpegniEffettivi;
 EXEC METRADTE.usp_AddIndexes_MetraDTE_attivitaProgrammateImpegniEffettivi_ImpegniEffettivi;
END;

MERGE INTO METRADTE.MetraDTE_attivitaProgrammateImpegniEffettivi_ImpegniEffettivi AS TGT
USING METRADTE.MetraDTE_attivitaProgrammateImpegniEffettivi_ImpegniEffettiviView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.IDScheda <> SRC.IDScheda OR TGT.impegnoEffettivo <> SRC.impegnoEffettivo)
  THEN UPDATE SET TGT.IDScheda = SRC.IDScheda, TGT.impegnoEffettivo = SRC.impegnoEffettivo
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, IDScheda, impegnoEffettivo)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
 CURRENT_TIMESTAMP AS merge_datetime,
 $action AS merge_action,
 'METRADTE.MetraDTE_attivitaProgrammateImpegniEffettivi_ImpegniEffettivi' AS full_olap_table_name,
 'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

