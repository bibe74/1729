
CREATE PROCEDURE MRDP.usp_Merge_RaccoltaDatiLotto_Lotti_Ordini_LottiOrdini
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDP.RaccoltaDatiLotto_Lotti_Ordini_LottiOrdini', N'U') IS NULL
BEGIN
	EXEC MRDP.usp_Create_RaccoltaDatiLotto_Lotti_Ordini_LottiOrdini;
	EXEC MRDP.usp_AddIndexes_RaccoltaDatiLotto_Lotti_Ordini_LottiOrdini;
END;

MERGE INTO MRDP.RaccoltaDatiLotto_Lotti_Ordini_LottiOrdini AS TGT
USING MRDP.RaccoltaDatiLotto_Lotti_Ordini_LottiOrdiniView (nolock) AS SRC
ON SRC.NumeroLotto = TGT.NumeroLotto AND SRC.NumeroOrdine = TGT.NumeroOrdine
--WHEN MATCHED AND ()
--  THEN UPDATE SET 
WHEN NOT MATCHED
  THEN INSERT VALUES (NumeroLotto, NumeroOrdine, ID)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'MRDP.RaccoltaDatiLotto_Lotti_Ordini_LottiOrdini' AS full_olap_table_name,
	'NumeroLotto = ' + CAST(COALESCE(inserted.NumeroLotto, deleted.NumeroLotto) AS NVARCHAR) + ' - ' + 'NumeroOrdine = ' + CAST(COALESCE(inserted.NumeroOrdine, deleted.NumeroOrdine) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

