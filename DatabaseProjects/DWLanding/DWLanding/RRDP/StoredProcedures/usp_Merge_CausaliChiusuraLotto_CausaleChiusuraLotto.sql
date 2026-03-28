
CREATE PROCEDURE RRDP.usp_Merge_CausaliChiusuraLotto_CausaleChiusuraLotto
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'RRDP.CausaliChiusuraLotto_CausaleChiusuraLotto', N'U') IS NULL
BEGIN
	EXEC RRDP.usp_Create_CausaliChiusuraLotto_CausaleChiusuraLotto;
	EXEC RRDP.usp_AddIndexes_CausaliChiusuraLotto_CausaleChiusuraLotto;
END;

MERGE INTO RRDP.CausaliChiusuraLotto_CausaleChiusuraLotto AS TGT
USING RRDP.CausaliChiusuraLotto_CausaleChiusuraLottoView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.Descrizione <> SRC.Descrizione OR TGT.EsitoProduzione <> SRC.EsitoProduzione)
  THEN UPDATE SET TGT.Descrizione = SRC.Descrizione, TGT.EsitoProduzione = SRC.EsitoProduzione
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, Descrizione, EsitoProduzione)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'RRDP.CausaliChiusuraLotto_CausaleChiusuraLotto' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

