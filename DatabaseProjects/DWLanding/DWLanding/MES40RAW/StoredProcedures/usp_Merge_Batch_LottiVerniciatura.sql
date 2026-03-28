
CREATE PROCEDURE MES40RAW.usp_Merge_Batch_LottiVerniciatura
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID('MES40RAW.Batch_LottiVerniciatura', N'U') IS NULL
BEGIN
    EXEC MES40RAW.usp_Create_Batch_LottiVerniciatura;
    EXEC MES40RAW.usp_AddIndexes_Batch_LottiVerniciatura;
END;

MERGE INTO MES40RAW.Batch_LottiVerniciatura AS TGT
USING MES40RAW.Batch_LottiVerniciaturaView (nolock) AS SRC
ON SRC.BatchID = TGT.BatchID
WHEN MATCHED AND (TGT.BatchStartTs <> SRC.BatchStartTs OR TGT.BatchStatusID <> SRC.BatchStatusID OR TGT.BatchStopTs <> SRC.BatchStopTs OR TGT.BatchTypeID <> SRC.BatchTypeID OR TGT.IsClosed <> SRC.IsClosed OR TGT.IsDeleted <> SRC.IsDeleted OR TGT.PaintFinishingID <> SRC.PaintFinishingID OR TGT.PaintingAreaID <> SRC.PaintingAreaID OR TGT.PaintingLineID <> SRC.PaintingLineID OR TGT.TagFinishingID <> SRC.TagFinishingID)
  THEN UPDATE SET TGT.BatchStartTs = SRC.BatchStartTs, TGT.BatchStatusID = SRC.BatchStatusID, TGT.BatchStopTs = SRC.BatchStopTs, TGT.BatchTypeID = SRC.BatchTypeID, TGT.IsClosed = SRC.IsClosed, TGT.IsDeleted = SRC.IsDeleted, TGT.PaintFinishingID = SRC.PaintFinishingID, TGT.PaintingAreaID = SRC.PaintingAreaID, TGT.PaintingLineID = SRC.PaintingLineID, TGT.TagFinishingID = SRC.TagFinishingID
WHEN NOT MATCHED
  THEN INSERT VALUES (BatchID, BatchStartTs, BatchStatusID, BatchStopTs, BatchTypeID, IsClosed, IsDeleted, PaintFinishingID, PaintingAreaID, PaintingLineID, TagFinishingID)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MES40RAW.Batch_LottiVerniciatura' AS full_olap_table_name,
    'BatchID = ' + CAST(COALESCE(inserted.BatchID, deleted.BatchID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

