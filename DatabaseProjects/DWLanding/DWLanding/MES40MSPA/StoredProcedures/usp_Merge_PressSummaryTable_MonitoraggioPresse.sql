
CREATE PROCEDURE MES40MSPA.usp_Merge_PressSummaryTable_MonitoraggioPresse
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID('MES40MSPA.PressSummaryTable_MonitoraggioPresse', N'U') IS NULL
BEGIN
    EXEC MES40MSPA.usp_Create_PressSummaryTable_MonitoraggioPresse;
    EXEC MES40MSPA.usp_AddIndexes_PressSummaryTable_MonitoraggioPresse;
END;

MERGE INTO MES40MSPA.PressSummaryTable_MonitoraggioPresse AS TGT
USING MES40MSPA.PressSummaryTable_MonitoraggioPresseView (nolock) AS SRC
ON SRC.PressID = TGT.PressID AND SRC.ShiftDate = TGT.ShiftDate AND SRC.ShiftID = TGT.ShiftID
WHEN MATCHED AND (TGT.DateStartTs <> SRC.DateStartTs OR TGT.DateEndTs <> SRC.DateEndTs OR TGT.ErpDuration <> SRC.ErpDuration OR TGT.ProdDuration <> SRC.ProdDuration OR TGT.DownDuration <> SRC.DownDuration)
  THEN UPDATE SET TGT.DateStartTs = SRC.DateStartTs, TGT.DateEndTs = SRC.DateEndTs, TGT.ErpDuration = SRC.ErpDuration, TGT.ProdDuration = SRC.ProdDuration, TGT.DownDuration = SRC.DownDuration
WHEN NOT MATCHED
  THEN INSERT VALUES (PressID, ShiftDate, ShiftID, DateStartTs, DateEndTs, ErpDuration, ProdDuration, DownDuration)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MES40MSPA.PressSummaryTable_MonitoraggioPresse' AS full_olap_table_name,
    'PressID = ' + CAST(COALESCE(inserted.PressID, deleted.PressID) AS NVARCHAR) + ' - ' + 'ShiftDate = ' + CAST(COALESCE(inserted.ShiftDate, deleted.ShiftDate) AS NVARCHAR) + ' - ' + 'ShiftID = ' + CAST(COALESCE(inserted.ShiftID, deleted.ShiftID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

