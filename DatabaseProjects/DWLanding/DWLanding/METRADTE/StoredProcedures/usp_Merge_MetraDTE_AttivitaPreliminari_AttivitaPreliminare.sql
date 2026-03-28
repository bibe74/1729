
CREATE PROCEDURE METRADTE.usp_Merge_MetraDTE_AttivitaPreliminari_AttivitaPreliminare
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'METRADTE.MetraDTE_AttivitaPreliminari_AttivitaPreliminare', N'U') IS NULL
BEGIN
	EXEC METRADTE.usp_Create_MetraDTE_AttivitaPreliminari_AttivitaPreliminare;
	EXEC METRADTE.usp_AddIndexes_MetraDTE_AttivitaPreliminari_AttivitaPreliminare;
END;

MERGE INTO METRADTE.MetraDTE_AttivitaPreliminari_AttivitaPreliminare AS TGT
USING METRADTE.MetraDTE_AttivitaPreliminari_AttivitaPreliminareView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.projectManager <> SRC.projectManager OR TGT.attivita <> SRC.attivita OR TGT.aperta <> SRC.aperta OR TGT.codiceCliente <> SRC.codiceCliente OR TGT.riferimentoAttivitaUnivoco <> SRC.riferimentoAttivitaUnivoco OR TGT.personaRiferimentoRichiedente <> SRC.personaRiferimentoRichiedente OR TGT.dataRicezioneEffettiva <> SRC.dataRicezioneEffettiva OR TGT.dataChiusura <> SRC.dataChiusura OR TGT._dataInsert <> SRC._dataInsert OR TGT._IDUtenteInsert <> SRC._IDUtenteInsert OR TGT.ambito <> SRC.ambito)
  THEN UPDATE SET TGT.projectManager = SRC.projectManager, TGT.attivita = SRC.attivita, TGT.aperta = SRC.aperta, TGT.codiceCliente = SRC.codiceCliente, TGT.riferimentoAttivitaUnivoco = SRC.riferimentoAttivitaUnivoco, TGT.personaRiferimentoRichiedente = SRC.personaRiferimentoRichiedente, TGT.dataRicezioneEffettiva = SRC.dataRicezioneEffettiva, TGT.dataChiusura = SRC.dataChiusura, TGT._dataInsert = SRC._dataInsert, TGT._IDUtenteInsert = SRC._IDUtenteInsert, TGT.ambito = SRC.ambito
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, projectManager, attivita, aperta, codiceCliente, riferimentoAttivitaUnivoco, personaRiferimentoRichiedente, dataRicezioneEffettiva, dataChiusura, _dataInsert, _IDUtenteInsert, ambito)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'METRADTE.MetraDTE_AttivitaPreliminari_AttivitaPreliminare' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

