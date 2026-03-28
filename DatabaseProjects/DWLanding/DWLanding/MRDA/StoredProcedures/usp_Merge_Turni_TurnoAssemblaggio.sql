
CREATE PROCEDURE MRDA.usp_Merge_Turni_TurnoAssemblaggio
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDA.Turni_TurnoAssemblaggio', N'U') IS NULL
BEGIN
	EXEC MRDA.usp_Create_Turni_TurnoAssemblaggio;
	EXEC MRDA.usp_AddIndexes_Turni_TurnoAssemblaggio;
END;

MERGE INTO MRDA.Turni_TurnoAssemblaggio AS TGT
USING MRDA.Turni_TurnoAssemblaggioView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.OraInizio <> SRC.OraInizio OR TGT.OraFine <> SRC.OraFine)
  THEN UPDATE SET TGT.OraInizio = SRC.OraInizio, TGT.OraFine = SRC.OraFine
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, OraInizio, OraFine)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'MRDA.Turni_TurnoAssemblaggio' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

