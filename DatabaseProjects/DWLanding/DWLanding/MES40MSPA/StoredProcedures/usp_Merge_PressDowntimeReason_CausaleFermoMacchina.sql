
CREATE PROCEDURE MES40MSPA.usp_Merge_PressDowntimeReason_CausaleFermoMacchina
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID('MES40MSPA.PressDowntimeReason_CausaleFermoMacchina', N'U') IS NULL
BEGIN
    EXEC MES40MSPA.usp_Create_PressDowntimeReason_CausaleFermoMacchina;
    EXEC MES40MSPA.usp_AddIndexes_PressDowntimeReason_CausaleFermoMacchina;
END;

MERGE INTO MES40MSPA.PressDowntimeReason_CausaleFermoMacchina AS TGT
USING MES40MSPA.PressDowntimeReason_CausaleFermoMacchinaView (nolock) AS SRC
ON SRC.PressDowntimeReasonID = TGT.PressDowntimeReasonID
WHEN MATCHED AND (TGT.Description <> SRC.Description OR TGT.OeeCLass <> SRC.OeeCLass OR TGT.AvailabilityClass <> SRC.AvailabilityClass OR TGT.IsActive <> SRC.IsActive OR TGT.IsPressUnavailable <> SRC.IsPressUnavailable)
  THEN UPDATE SET TGT.Description = SRC.Description, TGT.OeeCLass = SRC.OeeCLass, TGT.AvailabilityClass = SRC.AvailabilityClass, TGT.IsActive = SRC.IsActive, TGT.IsPressUnavailable = SRC.IsPressUnavailable
WHEN NOT MATCHED
  THEN INSERT VALUES (PressDowntimeReasonID, Description, OeeCLass, AvailabilityClass, IsActive, IsPressUnavailable)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MES40MSPA.PressDowntimeReason_CausaleFermoMacchina' AS full_olap_table_name,
    'PressDowntimeReasonID = ' + CAST(COALESCE(inserted.PressDowntimeReasonID, deleted.PressDowntimeReasonID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

