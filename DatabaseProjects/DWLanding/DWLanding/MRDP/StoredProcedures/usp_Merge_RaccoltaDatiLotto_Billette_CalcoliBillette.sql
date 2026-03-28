
CREATE PROCEDURE MRDP.usp_Merge_RaccoltaDatiLotto_Billette_CalcoliBillette
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDP.RaccoltaDatiLotto_Billette_CalcoliBillette', N'U') IS NULL
BEGIN
    EXEC MRDP.usp_Create_RaccoltaDatiLotto_Billette_CalcoliBillette;
    EXEC MRDP.usp_AddIndexes_RaccoltaDatiLotto_Billette_CalcoliBillette;
END;

MERGE INTO MRDP.RaccoltaDatiLotto_Billette_CalcoliBillette AS TGT
USING MRDP.RaccoltaDatiLotto_Billette_CalcoliBilletteView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.Turno <> SRC.Turno OR TGT.TurnoData <> SRC.TurnoData OR TGT.TurnoDataMetra <> SRC.TurnoDataMetra OR TGT.Lega <> SRC.Lega OR TGT.IsCambioMatrice <> SRC.IsCambioMatrice OR TGT.KgNettiTaglio <> SRC.KgNettiTaglio OR TGT.KgNettiImballo <> SRC.KgNettiImballo OR TGT.KgImballati <> SRC.KgImballati OR TGT.KgImballatiAXPesa <> SRC.KgImballatiAXPesa OR TGT.KgImballatiAXTeorico <> SRC.KgImballatiAXTeorico OR TGT.KgScartoCesoia <> SRC.KgScartoCesoia OR TGT.SecondiFermo <> SRC.SecondiFermo OR TGT.SecondiCiclo <> SRC.SecondiCiclo OR TGT.SecondiEstrusione <> SRC.SecondiEstrusione)
  THEN UPDATE SET TGT.Turno = SRC.Turno, TGT.TurnoData = SRC.TurnoData, TGT.TurnoDataMetra = SRC.TurnoDataMetra, TGT.Lega = SRC.Lega, TGT.IsCambioMatrice = SRC.IsCambioMatrice, TGT.KgNettiTaglio = SRC.KgNettiTaglio, TGT.KgNettiImballo = SRC.KgNettiImballo, TGT.KgImballati = SRC.KgImballati, TGT.KgImballatiAXPesa = SRC.KgImballatiAXPesa, TGT.KgImballatiAXTeorico = SRC.KgImballatiAXTeorico, TGT.KgScartoCesoia = SRC.KgScartoCesoia, TGT.SecondiFermo = SRC.SecondiFermo, TGT.SecondiCiclo = SRC.SecondiCiclo, TGT.SecondiEstrusione = SRC.SecondiEstrusione
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, Turno, TurnoData, TurnoDataMetra, Lega, IsCambioMatrice, KgNettiTaglio, KgNettiImballo, KgImballati, KgImballatiAXPesa, KgImballatiAXTeorico, KgScartoCesoia, SecondiFermo, SecondiCiclo, SecondiEstrusione)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MRDP.RaccoltaDatiLotto_Billette_CalcoliBillette' AS full_olap_table_name,
    'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

