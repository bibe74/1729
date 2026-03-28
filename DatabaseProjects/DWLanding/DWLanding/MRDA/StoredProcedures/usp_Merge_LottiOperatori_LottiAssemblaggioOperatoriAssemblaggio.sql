
CREATE PROCEDURE MRDA.usp_Merge_LottiOperatori_LottiAssemblaggioOperatoriAssemblaggio
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDA.LottiOperatori_LottiAssemblaggioOperatoriAssemblaggio', N'U') IS NULL
BEGIN
	EXEC MRDA.usp_Create_LottiOperatori_LottiAssemblaggioOperatoriAssemblaggio;
	EXEC MRDA.usp_AddIndexes_LottiOperatori_LottiAssemblaggioOperatoriAssemblaggio;
END;

MERGE INTO MRDA.LottiOperatori_LottiAssemblaggioOperatoriAssemblaggio AS TGT
USING MRDA.LottiOperatori_LottiAssemblaggioOperatoriAssemblaggioView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.IDLotto <> SRC.IDLotto OR TGT.IDOperatore <> SRC.IDOperatore)
  THEN UPDATE SET TGT.IDLotto = SRC.IDLotto, TGT.IDOperatore = SRC.IDOperatore
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, IDLotto, IDOperatore)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'MRDA.LottiOperatori_LottiAssemblaggioOperatoriAssemblaggio' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

