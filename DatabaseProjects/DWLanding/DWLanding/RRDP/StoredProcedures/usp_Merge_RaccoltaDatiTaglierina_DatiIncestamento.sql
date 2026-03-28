
CREATE PROCEDURE RRDP.usp_Merge_RaccoltaDatiTaglierina_DatiIncestamento
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'RRDP.RaccoltaDatiTaglierina_DatiIncestamento', N'U') IS NULL
BEGIN
	EXEC RRDP.usp_Create_RaccoltaDatiTaglierina_DatiIncestamento;
	EXEC RRDP.usp_AddIndexes_RaccoltaDatiTaglierina_DatiIncestamento;
END;

MERGE INTO RRDP.RaccoltaDatiTaglierina_DatiIncestamento AS TGT
USING RRDP.RaccoltaDatiTaglierina_DatiIncestamentoView (nolock) AS SRC
ON SRC.NumeroLotto = TGT.NumeroLotto AND SRC.NumeroCesta = TGT.NumeroCesta AND SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.LunghezzaTagliata <> SRC.LunghezzaTagliata OR TGT.Tipo <> SRC.Tipo OR TGT.Qta <> SRC.Qta)
  THEN UPDATE SET TGT.LunghezzaTagliata = SRC.LunghezzaTagliata, TGT.Tipo = SRC.Tipo, TGT.Qta = SRC.Qta
WHEN NOT MATCHED
  THEN INSERT VALUES (NumeroLotto, NumeroCesta, ID, LunghezzaTagliata, Tipo, Qta)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'RRDP.RaccoltaDatiTaglierina_DatiIncestamento' AS full_olap_table_name,
	'NumeroLotto = ' + CAST(COALESCE(inserted.NumeroLotto, deleted.NumeroLotto) AS NVARCHAR) + ' - ' + 'NumeroCesta = ' + CAST(COALESCE(inserted.NumeroCesta, deleted.NumeroCesta) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

