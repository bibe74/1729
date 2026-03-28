
CREATE PROCEDURE MRDA.usp_Merge_Postazioni_PostazioneAssemblaggio
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDA.Postazioni_PostazioneAssemblaggio', N'U') IS NULL
BEGIN
	EXEC MRDA.usp_Create_Postazioni_PostazioneAssemblaggio;
	EXEC MRDA.usp_AddIndexes_Postazioni_PostazioneAssemblaggio;
END;

MERGE INTO MRDA.Postazioni_PostazioneAssemblaggio AS TGT
USING MRDA.Postazioni_PostazioneAssemblaggioView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.Descrizione <> SRC.Descrizione OR TGT.WrkCtrId <> SRC.WrkCtrId OR TGT.GroupWrkCtrId <> SRC.GroupWrkCtrId OR TGT.Test <> SRC.Test)
  THEN UPDATE SET TGT.Descrizione = SRC.Descrizione, TGT.WrkCtrId = SRC.WrkCtrId, TGT.GroupWrkCtrId = SRC.GroupWrkCtrId, TGT.Test = SRC.Test
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, Descrizione, WrkCtrId, GroupWrkCtrId, Test)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'MRDA.Postazioni_PostazioneAssemblaggio' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

