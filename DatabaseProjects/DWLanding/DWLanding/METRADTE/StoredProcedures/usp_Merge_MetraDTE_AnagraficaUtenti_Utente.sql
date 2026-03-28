
CREATE PROCEDURE METRADTE.usp_Merge_MetraDTE_AnagraficaUtenti_Utente
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'METRADTE.MetraDTE_AnagraficaUtenti_Utente', N'U') IS NULL
BEGIN
 EXEC METRADTE.usp_Create_MetraDTE_AnagraficaUtenti_Utente;
 EXEC METRADTE.usp_AddIndexes_MetraDTE_AnagraficaUtenti_Utente;
END;

MERGE INTO METRADTE.MetraDTE_AnagraficaUtenti_Utente AS TGT
USING METRADTE.MetraDTE_AnagraficaUtenti_UtenteView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.Nome <> SRC.Nome OR TGT.Cognome <> SRC.Cognome)
  THEN UPDATE SET TGT.Nome = SRC.Nome, TGT.Cognome = SRC.Cognome
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, Nome, Cognome)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
 CURRENT_TIMESTAMP AS merge_datetime,
 $action AS merge_action,
 'METRADTE.MetraDTE_AnagraficaUtenti_Utente' AS full_olap_table_name,
 'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

