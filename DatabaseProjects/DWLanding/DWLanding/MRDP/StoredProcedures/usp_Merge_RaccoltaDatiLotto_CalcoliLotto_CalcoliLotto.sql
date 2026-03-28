
CREATE PROCEDURE MRDP.usp_Merge_RaccoltaDatiLotto_CalcoliLotto_CalcoliLotto
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDP.RaccoltaDatiLotto_CalcoliLotto_CalcoliLotto', N'U') IS NULL
BEGIN
    EXEC MRDP.usp_Create_RaccoltaDatiLotto_CalcoliLotto_CalcoliLotto;
    EXEC MRDP.usp_AddIndexes_RaccoltaDatiLotto_CalcoliLotto_CalcoliLotto;
END;

MERGE INTO MRDP.RaccoltaDatiLotto_CalcoliLotto_CalcoliLotto AS TGT
USING MRDP.RaccoltaDatiLotto_CalcoliLotto_CalcoliLottoView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.DiametroBilletta <> SRC.DiametroBilletta OR TGT.PesoProfiloAlMetroMatrice <> SRC.PesoProfiloAlMetroMatrice OR TGT.BarreTagliate <> SRC.BarreTagliate OR TGT.NumeroCeste <> SRC.NumeroCeste OR TGT.KgImballati <> SRC.KgImballati OR TGT.KgImballatiAXPesa <> SRC.KgImballatiAXPesa OR TGT.KgImballatiAXTeorico <> SRC.KgImballatiAXTeorico)
  THEN UPDATE SET TGT.DiametroBilletta = SRC.DiametroBilletta, TGT.PesoProfiloAlMetroMatrice = SRC.PesoProfiloAlMetroMatrice, TGT.BarreTagliate = SRC.BarreTagliate, TGT.NumeroCeste = SRC.NumeroCeste, TGT.KgImballati = SRC.KgImballati, TGT.KgImballatiAXPesa = SRC.KgImballatiAXPesa, TGT.KgImballatiAXTeorico = SRC.KgImballatiAXTeorico
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, DiametroBilletta, PesoProfiloAlMetroMatrice, BarreTagliate, NumeroCeste, KgImballati, KgImballatiAXPesa, KgImballatiAXTeorico)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MRDP.RaccoltaDatiLotto_CalcoliLotto_CalcoliLotto' AS full_olap_table_name,
    'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

