
CREATE PROCEDURE MES40MSPA.usp_Merge_BilletSummaryTable_MonitoraggioBillette
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID('MES40MSPA.BilletSummaryTable_MonitoraggioBillette', N'U') IS NULL
BEGIN
    EXEC MES40MSPA.usp_Create_BilletSummaryTable_MonitoraggioBillette;
    EXEC MES40MSPA.usp_AddIndexes_BilletSummaryTable_MonitoraggioBillette;
END;

MERGE INTO MES40MSPA.BilletSummaryTable_MonitoraggioBillette AS TGT
USING MES40MSPA.BilletSummaryTable_MonitoraggioBilletteView (nolock) AS SRC
ON SRC.PressID = TGT.PressID AND SRC.ShiftDate = TGT.ShiftDate AND SRC.ShiftID = TGT.ShiftID
WHEN MATCHED AND (TGT.BillCount <> SRC.BillCount OR TGT.StartTsNextBillErrCount <> SRC.StartTsNextBillErrCount OR TGT.TsSequenceErrCount <> SRC.TsSequenceErrCount OR TGT.BillKgErrCount <> SRC.BillKgErrCount OR TGT.BillCastingIdErrCount <> SRC.BillCastingIdErrCount)
  THEN UPDATE SET TGT.BillCount = SRC.BillCount, TGT.StartTsNextBillErrCount = SRC.StartTsNextBillErrCount, TGT.TsSequenceErrCount = SRC.TsSequenceErrCount, TGT.BillKgErrCount = SRC.BillKgErrCount, TGT.BillCastingIdErrCount = SRC.BillCastingIdErrCount
WHEN NOT MATCHED
  THEN INSERT VALUES (PressID, ShiftDate, ShiftID, BillCount, StartTsNextBillErrCount, TsSequenceErrCount, BillKgErrCount, BillCastingIdErrCount)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MES40MSPA.BilletSummaryTable_MonitoraggioBillette' AS full_olap_table_name,
    'PressID = ' + CAST(COALESCE(inserted.PressID, deleted.PressID) AS NVARCHAR) + ' - ' + 'ShiftDate = ' + CAST(COALESCE(inserted.ShiftDate, deleted.ShiftDate) AS NVARCHAR) + ' - ' + 'ShiftID = ' + CAST(COALESCE(inserted.ShiftID, deleted.ShiftID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

