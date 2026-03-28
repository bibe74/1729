
CREATE PROCEDURE MRDA.usp_Merge_FermiCalendario_FermiCalendario
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDA.FermiCalendario_FermiCalendario', N'U') IS NULL
BEGIN
    EXEC MRDA.usp_Create_FermiCalendario_FermiCalendario;
    EXEC MRDA.usp_AddIndexes_FermiCalendario_FermiCalendario;
END;

MERGE INTO MRDA.FermiCalendario_FermiCalendario AS TGT
USING MRDA.FermiCalendario_FermiCalendarioView (nolock) AS SRC
ON SRC.IDPostazione = TGT.IDPostazione AND SRC.TsStart = TGT.TsStart
WHEN MATCHED AND (TGT.TsStop <> SRC.TsStop)
  THEN UPDATE SET TGT.TsStop = SRC.TsStop
WHEN NOT MATCHED
  THEN INSERT VALUES (IDPostazione, TsStart, TsStop)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MRDA.FermiCalendario_FermiCalendario' AS full_olap_table_name,
    'IDPostazione = ' + CAST(COALESCE(inserted.IDPostazione, deleted.IDPostazione) AS NVARCHAR) + ' - ' + 'TsStart = ' + CAST(COALESCE(inserted.TsStart, deleted.TsStart) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

