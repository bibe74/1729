CREATE PROCEDURE MES40RAW.usp_Merge_PaintingTrans_TransazioniVerniciatura
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MES40RAW.PaintingTrans_TransazioniVerniciatura', N'U') IS NULL
BEGIN
    EXEC MES40RAW.usp_Create_PaintingTrans_TransazioniVerniciatura;
    EXEC MES40RAW.usp_AddIndexes_PaintingTrans_TransazioniVerniciatura;
END;

MERGE INTO MES40RAW.PaintingTrans_TransazioniVerniciatura AS TGT
USING MES40RAW.PaintingTrans_TransazioniVerniciaturaView (nolock) AS SRC
ON SRC.PaintingTransID = TGT.PaintingTransID
WHEN MATCHED AND (TGT.BarLength <> SRC.BarLength OR TGT.BatchID <> SRC.BatchID OR TGT.CreatedTs <> SRC.CreatedTs OR TGT.IsPacked <> SRC.IsPacked OR TGT.ItemID <> SRC.ItemID OR TGT.PackedTs <> SRC.PackedTs OR TGT.PackQty <> SRC.PackQty OR TGT.PaintFinishingID <> SRC.PaintFinishingID OR TGT.ProdID <> SRC.ProdID OR TGT.Qty <> SRC.Qty OR TGT.ScrapQty <> SRC.ScrapQty OR TGT.ShiftDate <> SRC.ShiftDate OR TGT.ShiftID <> SRC.ShiftID OR TGT.TagFinishingID <> SRC.TagFinishingID OR TGT.WrkCtrID <> SRC.WrkCtrID OR TGT.ModuleID <> SRC.ModuleID)
  THEN UPDATE SET TGT.BarLength = SRC.BarLength, TGT.BatchID = SRC.BatchID, TGT.CreatedTs = SRC.CreatedTs, TGT.IsPacked = SRC.IsPacked, TGT.ItemID = SRC.ItemID, TGT.PackedTs = SRC.PackedTs, TGT.PackQty = SRC.PackQty, TGT.PaintFinishingID = SRC.PaintFinishingID, TGT.ProdID = SRC.ProdID, TGT.Qty = SRC.Qty, TGT.ScrapQty = SRC.ScrapQty, TGT.ShiftDate = SRC.ShiftDate, TGT.ShiftID = SRC.ShiftID, TGT.TagFinishingID = SRC.TagFinishingID, TGT.WrkCtrID = SRC.WrkCtrID, TGT.ModuleID = SRC.ModuleID
WHEN NOT MATCHED
  THEN INSERT VALUES (PaintingTransID, BarLength, BatchID, CreatedTs, IsPacked, ItemID, PackedTs, PackQty, PaintFinishingID, ProdID, Qty, ScrapQty, ShiftDate, ShiftID, TagFinishingID, WrkCtrID, ModuleID)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MES40RAW.PaintingTrans_TransazioniVerniciatura' AS full_olap_table_name,
    'PaintingTransID = ' + CAST(COALESCE(inserted.PaintingTransID, deleted.PaintingTransID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

