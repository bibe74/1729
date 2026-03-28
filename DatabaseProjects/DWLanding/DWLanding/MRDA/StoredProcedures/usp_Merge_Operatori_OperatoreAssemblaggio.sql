
CREATE PROCEDURE MRDA.usp_Merge_Operatori_OperatoreAssemblaggio
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDA.Operatori_OperatoreAssemblaggio', N'U') IS NULL
BEGIN
	EXEC MRDA.usp_Create_Operatori_OperatoreAssemblaggio;
	EXEC MRDA.usp_AddIndexes_Operatori_OperatoreAssemblaggio;
END;

MERGE INTO MRDA.Operatori_OperatoreAssemblaggio AS TGT
USING MRDA.Operatori_OperatoreAssemblaggioView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.Cognome <> SRC.Cognome OR TGT.Nome <> SRC.Nome)
  THEN UPDATE SET TGT.Cognome = SRC.Cognome, TGT.Nome = SRC.Nome
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, Cognome, Nome)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'MRDA.Operatori_OperatoreAssemblaggio' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

