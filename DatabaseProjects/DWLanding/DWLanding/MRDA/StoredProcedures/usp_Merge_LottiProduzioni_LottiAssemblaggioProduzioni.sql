
CREATE PROCEDURE MRDA.usp_Merge_LottiProduzioni_LottiAssemblaggioProduzioni
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDA.LottiProduzioni_LottiAssemblaggioProduzioni', N'U') IS NULL
BEGIN
    EXEC MRDA.usp_Create_LottiProduzioni_LottiAssemblaggioProduzioni;
    EXEC MRDA.usp_AddIndexes_LottiProduzioni_LottiAssemblaggioProduzioni;
END;

MERGE INTO MRDA.LottiProduzioni_LottiAssemblaggioProduzioni AS TGT
USING MRDA.LottiProduzioni_LottiAssemblaggioProduzioniView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.IDLotto <> SRC.IDLotto OR TGT.Inizio_Ts <> SRC.Inizio_Ts OR TGT.Fine_Ts <> SRC.Fine_Ts OR TGT.Qta <> SRC.Qta OR TGT.NumeroPassate <> SRC.NumeroPassate OR TGT.ItemId <> SRC.ItemId OR TGT.ItemLength <> SRC.ItemLength OR TGT.ProdRidotta <> SRC.ProdRidotta OR TGT.ProdRidotta_IDCausale <> SRC.ProdRidotta_IDCausale)
  THEN UPDATE SET TGT.IDLotto = SRC.IDLotto, TGT.Inizio_Ts = SRC.Inizio_Ts, TGT.Fine_Ts = SRC.Fine_Ts, TGT.Qta = SRC.Qta, TGT.NumeroPassate = SRC.NumeroPassate, TGT.ItemId = SRC.ItemId, TGT.ItemLength = SRC.ItemLength, TGT.ProdRidotta = SRC.ProdRidotta, TGT.ProdRidotta_IDCausale = SRC.ProdRidotta_IDCausale
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, IDLotto, Inizio_Ts, Fine_Ts, Qta, NumeroPassate, ItemId, ItemLength, ProdRidotta, ProdRidotta_IDCausale)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MRDA.LottiProduzioni_LottiAssemblaggioProduzioni' AS full_olap_table_name,
    'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

