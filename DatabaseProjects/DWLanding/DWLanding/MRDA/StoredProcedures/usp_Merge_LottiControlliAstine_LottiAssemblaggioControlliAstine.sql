
CREATE PROCEDURE MRDA.usp_Merge_LottiControlliAstine_LottiAssemblaggioControlliAstine
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDA.LottiControlliAstine_LottiAssemblaggioControlliAstine', N'U') IS NULL
BEGIN
	EXEC MRDA.usp_Create_LottiControlliAstine_LottiAssemblaggioControlliAstine;
	EXEC MRDA.usp_AddIndexes_LottiControlliAstine_LottiAssemblaggioControlliAstine;
END;

MERGE INTO MRDA.LottiControlliAstine_LottiAssemblaggioControlliAstine AS TGT
USING MRDA.LottiControlliAstine_LottiAssemblaggioControlliAstineView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.IDLottoControllo <> SRC.IDLottoControllo OR TGT.CodiceAstina <> SRC.CodiceAstina OR TGT.LottoAstina <> SRC.LottoAstina)
  THEN UPDATE SET TGT.IDLottoControllo = SRC.IDLottoControllo, TGT.CodiceAstina = SRC.CodiceAstina, TGT.LottoAstina = SRC.LottoAstina
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, IDLottoControllo, CodiceAstina, LottoAstina)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'MRDA.LottiControlliAstine_LottiAssemblaggioControlliAstine' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

