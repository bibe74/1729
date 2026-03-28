
CREATE PROCEDURE MES40MSPA.usp_Merge_BatchSummaryTable_MonitoraggioLotti
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID('MES40MSPA.BatchSummaryTable_MonitoraggioLotti', N'U') IS NULL
BEGIN
    EXEC MES40MSPA.usp_Create_BatchSummaryTable_MonitoraggioLotti;
    EXEC MES40MSPA.usp_AddIndexes_BatchSummaryTable_MonitoraggioLotti;
END;

MERGE INTO MES40MSPA.BatchSummaryTable_MonitoraggioLotti AS TGT
USING MES40MSPA.BatchSummaryTable_MonitoraggioLottiView (nolock) AS SRC
ON SRC.PressID = TGT.PressID AND SRC.ShiftDate = TGT.ShiftDate AND SRC.ShiftID = TGT.ShiftID
WHEN MATCHED AND (TGT.BatchCount <> SRC.BatchCount OR TGT.MinItemMeterWeightDeviationPerc <> SRC.MinItemMeterWeightDeviationPerc OR TGT.MaxItemMeterWeightDeviationPerc <> SRC.MaxItemMeterWeightDeviationPerc OR TGT.AvgItemMeterWeightDeviationPerc <> SRC.AvgItemMeterWeightDeviationPerc OR TGT.ItemMeterWeightDeviationCountTh0 <> SRC.ItemMeterWeightDeviationCountTh0 OR TGT.ItemMeterWeightDeviationCountTh1 <> SRC.ItemMeterWeightDeviationCountTh1 OR TGT.ItemMeterWeightDeviationCountTh2 <> SRC.ItemMeterWeightDeviationCountTh2 OR TGT.ItemMeterWeightMesMissCount <> SRC.ItemMeterWeightMesMissCount OR TGT.ItemMeterWeightTestMissCount <> SRC.ItemMeterWeightTestMissCount)
  THEN UPDATE SET TGT.BatchCount = SRC.BatchCount, TGT.MinItemMeterWeightDeviationPerc = SRC.MinItemMeterWeightDeviationPerc, TGT.MaxItemMeterWeightDeviationPerc = SRC.MaxItemMeterWeightDeviationPerc, TGT.AvgItemMeterWeightDeviationPerc = SRC.AvgItemMeterWeightDeviationPerc, TGT.ItemMeterWeightDeviationCountTh0 = SRC.ItemMeterWeightDeviationCountTh0, TGT.ItemMeterWeightDeviationCountTh1 = SRC.ItemMeterWeightDeviationCountTh1, TGT.ItemMeterWeightDeviationCountTh2 = SRC.ItemMeterWeightDeviationCountTh2, TGT.ItemMeterWeightMesMissCount = SRC.ItemMeterWeightMesMissCount, TGT.ItemMeterWeightTestMissCount = SRC.ItemMeterWeightTestMissCount
WHEN NOT MATCHED
  THEN INSERT VALUES (PressID, ShiftDate, ShiftID, BatchCount, MinItemMeterWeightDeviationPerc, MaxItemMeterWeightDeviationPerc, AvgItemMeterWeightDeviationPerc, ItemMeterWeightDeviationCountTh0, ItemMeterWeightDeviationCountTh1, ItemMeterWeightDeviationCountTh2, ItemMeterWeightMesMissCount, ItemMeterWeightTestMissCount)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MES40MSPA.BatchSummaryTable_MonitoraggioLotti' AS full_olap_table_name,
    'PressID = ' + CAST(COALESCE(inserted.PressID, deleted.PressID) AS NVARCHAR) + ' - ' + 'ShiftDate = ' + CAST(COALESCE(inserted.ShiftDate, deleted.ShiftDate) AS NVARCHAR) + ' - ' + 'ShiftID = ' + CAST(COALESCE(inserted.ShiftID, deleted.ShiftID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

