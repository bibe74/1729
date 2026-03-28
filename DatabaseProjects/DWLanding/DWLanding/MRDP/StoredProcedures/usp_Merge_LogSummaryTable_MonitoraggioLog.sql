
CREATE PROCEDURE MRDP.usp_Merge_LogSummaryTable_MonitoraggioLog
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID('MRDP.LogSummaryTable_MonitoraggioLog', N'U') IS NULL
BEGIN
    EXEC MRDP.usp_Create_LogSummaryTable_MonitoraggioLog;
    EXEC MRDP.usp_AddIndexes_LogSummaryTable_MonitoraggioLog;
END;

MERGE INTO MRDP.LogSummaryTable_MonitoraggioLog AS TGT
USING MRDP.LogSummaryTable_MonitoraggioLogView (nolock) AS SRC
ON SRC.PressID = TGT.PressID AND SRC.ShiftDate = TGT.ShiftDate AND SRC.ShiftID = TGT.ShiftID
WHEN MATCHED AND (TGT.LogCount <> SRC.LogCount OR TGT.LogQrCodeReadCount <> SRC.LogQrCodeReadCount OR TGT.LogQrCodeMissCount <> SRC.LogQrCodeMissCount OR TGT.LogKg <> SRC.LogKg OR TGT.LogBillKg <> SRC.LogBillKg OR TGT.LogBillCount <> SRC.LogBillCount OR TGT.MinLogKgDeviationPerc <> SRC.MinLogKgDeviationPerc OR TGT.MaxLogKgDeviationPerc <> SRC.MaxLogKgDeviationPerc OR TGT.AvgLogKgDeviationPerc <> SRC.AvgLogKgDeviationPerc OR TGT.LogKgDeviationCountTh0 <> SRC.LogKgDeviationCountTh0 OR TGT.LogKgDeviationCountTh1 <> SRC.LogKgDeviationCountTh1 OR TGT.LogKgDeviationCountTh2 <> SRC.LogKgDeviationCountTh2 OR TGT.MinLogBillKgDeviationPerc <> SRC.MinLogBillKgDeviationPerc OR TGT.MaxLogBillKgDeviationPerc <> SRC.MaxLogBillKgDeviationPerc OR TGT.AvgLogBillKgDeviationPerc <> SRC.AvgLogBillKgDeviationPerc OR TGT.LogBillKgDeviationCountTh0 <> SRC.LogBillKgDeviationCountTh0 OR TGT.LogBillKgDeviationCountTh1 <> SRC.LogBillKgDeviationCountTh1 OR TGT.LogBillKgDeviationCountTh2 <> SRC.LogBillKgDeviationCountTh2)
  THEN UPDATE SET TGT.LogCount = SRC.LogCount, TGT.LogQrCodeReadCount = SRC.LogQrCodeReadCount, TGT.LogQrCodeMissCount = SRC.LogQrCodeMissCount, TGT.LogKg = SRC.LogKg, TGT.LogBillKg = SRC.LogBillKg, TGT.LogBillCount = SRC.LogBillCount, TGT.MinLogKgDeviationPerc = SRC.MinLogKgDeviationPerc, TGT.MaxLogKgDeviationPerc = SRC.MaxLogKgDeviationPerc, TGT.AvgLogKgDeviationPerc = SRC.AvgLogKgDeviationPerc, TGT.LogKgDeviationCountTh0 = SRC.LogKgDeviationCountTh0, TGT.LogKgDeviationCountTh1 = SRC.LogKgDeviationCountTh1, TGT.LogKgDeviationCountTh2 = SRC.LogKgDeviationCountTh2, TGT.MinLogBillKgDeviationPerc = SRC.MinLogBillKgDeviationPerc, TGT.MaxLogBillKgDeviationPerc = SRC.MaxLogBillKgDeviationPerc, TGT.AvgLogBillKgDeviationPerc = SRC.AvgLogBillKgDeviationPerc, TGT.LogBillKgDeviationCountTh0 = SRC.LogBillKgDeviationCountTh0, TGT.LogBillKgDeviationCountTh1 = SRC.LogBillKgDeviationCountTh1, TGT.LogBillKgDeviationCountTh2 = SRC.LogBillKgDeviationCountTh2
WHEN NOT MATCHED
  THEN INSERT VALUES (PressID, ShiftDate, ShiftID, LogCount, LogQrCodeReadCount, LogQrCodeMissCount, LogKg, LogBillKg, LogBillCount, MinLogKgDeviationPerc, MaxLogKgDeviationPerc, AvgLogKgDeviationPerc, LogKgDeviationCountTh0, LogKgDeviationCountTh1, LogKgDeviationCountTh2, MinLogBillKgDeviationPerc, MaxLogBillKgDeviationPerc, AvgLogBillKgDeviationPerc, LogBillKgDeviationCountTh0, LogBillKgDeviationCountTh1, LogBillKgDeviationCountTh2)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MRDP.LogSummaryTable_MonitoraggioLog' AS full_olap_table_name,
    'PressID = ' + CAST(COALESCE(inserted.PressID, deleted.PressID) AS NVARCHAR) + ' - ' + 'ShiftDate = ' + CAST(COALESCE(inserted.ShiftDate, deleted.ShiftDate) AS NVARCHAR) + ' - ' + 'ShiftID = ' + CAST(COALESCE(inserted.ShiftID, deleted.ShiftID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

