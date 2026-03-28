
CREATE PROCEDURE MRDA.usp_Merge_LottiOrdini_LottiAssemblaggioOrdini
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDA.LottiOrdini_LottiAssemblaggioOrdini', N'U') IS NULL
BEGIN
	EXEC MRDA.usp_Create_LottiOrdini_LottiAssemblaggioOrdini;
	EXEC MRDA.usp_AddIndexes_LottiOrdini_LottiAssemblaggioOrdini;
END;

MERGE INTO MRDA.LottiOrdini_LottiAssemblaggioOrdini AS TGT
USING MRDA.LottiOrdini_LottiAssemblaggioOrdiniView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.IDLotto <> SRC.IDLotto OR TGT.OrdineProduzione <> SRC.OrdineProduzione OR TGT.OrdineCliente <> SRC.OrdineCliente OR TGT.Qta <> SRC.Qta)
  THEN UPDATE SET TGT.IDLotto = SRC.IDLotto, TGT.OrdineProduzione = SRC.OrdineProduzione, TGT.OrdineCliente = SRC.OrdineCliente, TGT.Qta = SRC.Qta
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, IDLotto, OrdineProduzione, OrdineCliente, Qta)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'MRDA.LottiOrdini_LottiAssemblaggioOrdini' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

