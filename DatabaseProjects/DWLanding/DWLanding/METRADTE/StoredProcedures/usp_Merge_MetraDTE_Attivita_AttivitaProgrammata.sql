
CREATE PROCEDURE METRADTE.usp_Merge_MetraDTE_Attivita_AttivitaProgrammata
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'METRADTE.MetraDTE_Attivita_AttivitaProgrammata', N'U') IS NULL
BEGIN
	EXEC METRADTE.usp_Create_MetraDTE_Attivita_AttivitaProgrammata;
	EXEC METRADTE.usp_AddIndexes_MetraDTE_Attivita_AttivitaProgrammata;
END;

MERGE INTO METRADTE.MetraDTE_Attivita_AttivitaProgrammata AS TGT
USING METRADTE.MetraDTE_Attivita_AttivitaProgrammataView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.IDSchedaPreliminare <> SRC.IDSchedaPreliminare OR TGT.incaricato <> SRC.incaricato OR TGT.attivita <> SRC.attivita OR TGT.riferimentoCommessaNumero <> SRC.riferimentoCommessaNumero OR TGT.agenteTecnico <> SRC.agenteTecnico OR TGT._IDUtenteInsert <> SRC._IDUtenteInsert OR TGT.ambito <> SRC.ambito)
  THEN UPDATE SET TGT.IDSchedaPreliminare = SRC.IDSchedaPreliminare, TGT.incaricato = SRC.incaricato, TGT.attivita = SRC.attivita, TGT.riferimentoCommessaNumero = SRC.riferimentoCommessaNumero, TGT.agenteTecnico = SRC.agenteTecnico, TGT._IDUtenteInsert = SRC._IDUtenteInsert, TGT.ambito = SRC.ambito
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, IDSchedaPreliminare, incaricato, attivita, riferimentoCommessaNumero, agenteTecnico, _IDUtenteInsert, ambito)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'METRADTE.MetraDTE_Attivita_AttivitaProgrammata' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

