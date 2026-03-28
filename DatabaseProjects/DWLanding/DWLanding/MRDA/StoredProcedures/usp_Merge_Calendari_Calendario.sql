CREATE   PROCEDURE MRDA.usp_Merge_Calendari_Calendario
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDA.Calendari_Calendario', N'U') IS NULL
BEGIN
	EXEC MRDA.usp_Create_Calendari_Calendario;
	EXEC MRDA.usp_AddIndexes_Calendari_Calendario;
END;

MERGE INTO MRDA.Calendari_Calendario AS TGT
USING MRDA.Calendari_CalendarioView (nolock) AS SRC
ON SRC.IDPostazione = TGT.IDPostazione AND SRC.TransDate = TGT.TransDate AND SRC.TsStart = TGT.TsStart
WHEN MATCHED AND (TGT.TsStop <> SRC.TsStop)
  THEN UPDATE SET TGT.TsStop = SRC.TsStop
WHEN NOT MATCHED
  THEN INSERT VALUES (SRC.IDPostazione, SRC.TransDate, SRC.TsStart, SRC.TsStop)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'MRDA.Calendari_Calendario' AS full_olap_table_name,
	'IDPostazione = ' + CAST(COALESCE(inserted.IDPostazione, deleted.IDPostazione) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

