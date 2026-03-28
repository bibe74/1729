
CREATE PROCEDURE MES40ALMA.usp_Merge_BatchDowntime_FermiMacchina
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID('MES40ALMA.BatchDowntime_FermiMacchina', 'U') IS NULL
BEGIN
    EXEC MES40ALMA.usp_Create_BatchDowntime_FermiMacchina;
    EXEC MES40ALMA.usp_AddIndexes_BatchDowntime_FermiMacchina;
END;

MERGE INTO MES40ALMA.BatchDowntime_FermiMacchina AS TGT
USING MES40ALMA.BatchDowntime_FermiMacchinaView (nolock) AS SRC
ON SRC.BatchDowntimeID = TGT.BatchDowntimeID
WHEN MATCHED AND (TGT.PressID <> SRC.PressID OR TGT.DowntimeReasonID <> SRC.DowntimeReasonID OR TGT.DowntimeCode <> SRC.DowntimeCode OR TGT.StartTs <> SRC.StartTs OR TGT.StopTs <> SRC.StopTs OR TGT.DowntimeType <> SRC.DowntimeType OR TGT.FailureType <> SRC.FailureType OR TGT.DowntimeReasonDescription <> SRC.DowntimeReasonDescription OR TGT.DowntimeTypeDescription <> SRC.DowntimeTypeDescription OR TGT.FailureTypeDescription <> SRC.FailureTypeDescription)
  THEN UPDATE SET TGT.PressID = SRC.PressID, TGT.DowntimeReasonID = SRC.DowntimeReasonID, TGT.DowntimeCode = SRC.DowntimeCode, TGT.StartTs = SRC.StartTs, TGT.StopTs = SRC.StopTs, TGT.DowntimeType = SRC.DowntimeType, TGT.FailureType = SRC.FailureType, TGT.DowntimeReasonDescription = SRC.DowntimeReasonDescription, TGT.DowntimeTypeDescription = SRC.DowntimeTypeDescription, TGT.FailureTypeDescription = SRC.FailureTypeDescription
WHEN NOT MATCHED
  THEN INSERT VALUES (BatchDowntimeID, PressID, DowntimeReasonID, DowntimeCode, StartTs, StopTs, DowntimeType, FailureType, DowntimeReasonDescription, DowntimeTypeDescription, FailureTypeDescription)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MES40ALMA.BatchDowntime_FermiMacchina' AS full_olap_table_name,
    'BatchDowntimeID = ' + CAST(COALESCE(inserted.BatchDowntimeID, deleted.BatchDowntimeID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

