
CREATE PROCEDURE MRDA.usp_Merge_LottiControlli_LottiAssemblaggioControlli
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDA.LottiControlli_LottiAssemblaggioControlli', N'U') IS NULL
BEGIN
	EXEC MRDA.usp_Create_LottiControlli_LottiAssemblaggioControlli;
	EXEC MRDA.usp_AddIndexes_LottiControlli_LottiAssemblaggioControlli;
END;

MERGE INTO MRDA.LottiControlli_LottiAssemblaggioControlli AS TGT
USING MRDA.LottiControlli_LottiAssemblaggioControlliView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.IDLotto <> SRC.IDLotto OR TGT.Ts <> SRC.Ts OR TGT.NumeroBarra <> SRC.NumeroBarra OR TGT.PlanaritaConforme <> SRC.PlanaritaConforme OR TGT.ProvaT_Grezzo <> SRC.ProvaT_Grezzo OR TGT.ProvaT_Grezzo2 <> SRC.ProvaT_Grezzo2 OR TGT.ProvaT_DopoForno <> SRC.ProvaT_DopoForno OR TGT.ProvaQ_Grezzo <> SRC.ProvaQ_Grezzo OR TGT.ProvaQ_Lunghezza <> SRC.ProvaQ_Lunghezza OR TGT.ProvaQ_Misura <> SRC.ProvaQ_Misura OR TGT.ProvaQ_DopoForno <> SRC.ProvaQ_DopoForno)
  THEN UPDATE SET TGT.IDLotto = SRC.IDLotto, TGT.Ts = SRC.Ts, TGT.NumeroBarra = SRC.NumeroBarra, TGT.PlanaritaConforme = SRC.PlanaritaConforme, TGT.ProvaT_Grezzo = SRC.ProvaT_Grezzo, TGT.ProvaT_Grezzo2 = SRC.ProvaT_Grezzo2, TGT.ProvaT_DopoForno = SRC.ProvaT_DopoForno, TGT.ProvaQ_Grezzo = SRC.ProvaQ_Grezzo, TGT.ProvaQ_Lunghezza = SRC.ProvaQ_Lunghezza, TGT.ProvaQ_Misura = SRC.ProvaQ_Misura, TGT.ProvaQ_DopoForno = SRC.ProvaQ_DopoForno
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, IDLotto, Ts, NumeroBarra, PlanaritaConforme, ProvaT_Grezzo, ProvaT_Grezzo2, ProvaT_DopoForno, ProvaQ_Grezzo, ProvaQ_Lunghezza, ProvaQ_Misura, ProvaQ_DopoForno)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'MRDA.LottiControlli_LottiAssemblaggioControlli' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

