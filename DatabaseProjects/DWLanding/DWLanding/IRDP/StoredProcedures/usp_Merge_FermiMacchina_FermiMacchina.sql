
CREATE PROCEDURE IRDP.usp_Merge_FermiMacchina_FermiMacchina
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID('IRDP.FermiMacchina_FermiMacchina', 'U') IS NULL
BEGIN
    EXEC IRDP.usp_Create_FermiMacchina_FermiMacchina;
    EXEC IRDP.usp_AddIndexes_FermiMacchina_FermiMacchina;
END;

MERGE INTO IRDP.FermiMacchina_FermiMacchina AS TGT
USING IRDP.FermiMacchina_FermiMacchinaView (nolock) AS SRC
ON SRC.BatchDowntimeID = TGT.BatchDowntimeID
WHEN MATCHED AND (TGT.PressID <> SRC.PressID OR TGT.DowntimeReasonID <> SRC.DowntimeReasonID OR TGT.DowntimeCode <> SRC.DowntimeCode OR TGT.StartTs <> SRC.StartTs OR TGT.StopTs <> SRC.StopTs OR TGT.DowntimeType <> SRC.DowntimeType OR TGT.FailureType <> SRC.FailureType OR TGT.DowntimeReasonDescription <> SRC.DowntimeReasonDescription OR TGT.DowntimeTypeDescription <> SRC.DowntimeTypeDescription OR TGT.FailureTypeDescription <> SRC.FailureTypeDescription OR TGT.MicroDowntimeType <> SRC.MicroDowntimeType OR TGT.MicroDowntimeDuration <> SRC.MicroDowntimeDuration)
  THEN UPDATE SET TGT.PressID = SRC.PressID, TGT.DowntimeReasonID = SRC.DowntimeReasonID, TGT.DowntimeCode = SRC.DowntimeCode, TGT.StartTs = SRC.StartTs, TGT.StopTs = SRC.StopTs, TGT.DowntimeType = SRC.DowntimeType, TGT.FailureType = SRC.FailureType, TGT.DowntimeReasonDescription = SRC.DowntimeReasonDescription, TGT.DowntimeTypeDescription = SRC.DowntimeTypeDescription, TGT.FailureTypeDescription = SRC.FailureTypeDescription, TGT.MicroDowntimeType = SRC.MicroDowntimeType, TGT.MicroDowntimeDuration = SRC.MicroDowntimeDuration
WHEN NOT MATCHED
  THEN INSERT VALUES (BatchDowntimeID, PressID, DowntimeReasonID, DowntimeCode, StartTs, StopTs, DowntimeType, FailureType, DowntimeReasonDescription, DowntimeTypeDescription, FailureTypeDescription, MicroDowntimeType, MicroDowntimeDuration)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'IRDP.FermiMacchina_FermiMacchina' AS full_olap_table_name,
    'BatchDowntimeID = ' + CAST(COALESCE(inserted.BatchDowntimeID, deleted.BatchDowntimeID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

