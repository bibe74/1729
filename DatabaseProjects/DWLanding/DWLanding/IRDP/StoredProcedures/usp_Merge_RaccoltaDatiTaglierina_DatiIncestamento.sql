
CREATE PROCEDURE IRDP.usp_Merge_RaccoltaDatiTaglierina_DatiIncestamento
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'IRDP.RaccoltaDatiTaglierina_DatiIncestamento', N'U') IS NULL
BEGIN
	EXEC IRDP.usp_Create_RaccoltaDatiTaglierina_DatiIncestamento;
	EXEC IRDP.usp_AddIndexes_RaccoltaDatiTaglierina_DatiIncestamento;
END;

MERGE INTO IRDP.RaccoltaDatiTaglierina_DatiIncestamento AS TGT
USING IRDP.RaccoltaDatiTaglierina_DatiIncestamentoView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.LunghezzaTagliata <> SRC.LunghezzaTagliata OR TGT.NumeroLotto <> SRC.NumeroLotto OR TGT.NumeroCesta <> SRC.NumeroCesta OR TGT.Tipo <> SRC.Tipo OR TGT.Qta <> SRC.Qta)
  THEN UPDATE SET TGT.LunghezzaTagliata = SRC.LunghezzaTagliata, TGT.NumeroLotto = SRC.NumeroLotto, TGT.NumeroCesta = SRC.NumeroCesta, TGT.Tipo = SRC.Tipo, TGT.Qta = SRC.Qta
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, LunghezzaTagliata, NumeroLotto, NumeroCesta, Tipo, Qta)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'IRDP.RaccoltaDatiTaglierina_DatiIncestamento' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

