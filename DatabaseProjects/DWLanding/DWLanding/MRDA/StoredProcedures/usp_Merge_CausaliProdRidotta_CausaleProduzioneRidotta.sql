
CREATE PROCEDURE MRDA.usp_Merge_CausaliProdRidotta_CausaleProduzioneRidotta
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDA.CausaliProdRidotta_CausaleProduzioneRidotta', N'U') IS NULL
BEGIN
    EXEC MRDA.usp_Create_CausaliProdRidotta_CausaleProduzioneRidotta;
    EXEC MRDA.usp_AddIndexes_CausaliProdRidotta_CausaleProduzioneRidotta;
END;

MERGE INTO MRDA.CausaliProdRidotta_CausaleProduzioneRidotta AS TGT
USING MRDA.CausaliProdRidotta_CausaleProduzioneRidottaView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.Descrizione <> SRC.Descrizione)
  THEN UPDATE SET TGT.Descrizione = SRC.Descrizione
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, Descrizione)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MRDA.CausaliProdRidotta_CausaleProduzioneRidotta' AS full_olap_table_name,
    'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

