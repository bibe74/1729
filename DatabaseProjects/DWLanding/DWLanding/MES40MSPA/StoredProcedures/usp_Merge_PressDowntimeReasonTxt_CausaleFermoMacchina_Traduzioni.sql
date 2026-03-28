
CREATE PROCEDURE MES40MSPA.usp_Merge_PressDowntimeReasonTxt_CausaleFermoMacchina_Traduzioni
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID('MES40MSPA.PressDowntimeReasonTxt_CausaleFermoMacchina_Traduzioni', N'U') IS NULL
BEGIN
    EXEC MES40MSPA.usp_Create_PressDowntimeReasonTxt_CausaleFermoMacchina_Traduzioni;
    EXEC MES40MSPA.usp_AddIndexes_PressDowntimeReasonTxt_CausaleFermoMacchina_Traduzioni;
END;

MERGE INTO MES40MSPA.PressDowntimeReasonTxt_CausaleFermoMacchina_Traduzioni AS TGT
USING MES40MSPA.PressDowntimeReasonTxt_CausaleFermoMacchina_TraduzioniView (nolock) AS SRC
ON SRC.PressDowntimeReasonTxtID = TGT.PressDowntimeReasonTxtID
WHEN MATCHED AND (TGT.PressDowntimeReasonID <> SRC.PressDowntimeReasonID OR TGT.LanguageID <> SRC.LanguageID OR TGT.Description <> SRC.Description)
  THEN UPDATE SET TGT.PressDowntimeReasonID = SRC.PressDowntimeReasonID, TGT.LanguageID = SRC.LanguageID, TGT.Description = SRC.Description
WHEN NOT MATCHED
  THEN INSERT VALUES (PressDowntimeReasonTxtID, PressDowntimeReasonID, LanguageID, Description)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MES40MSPA.PressDowntimeReasonTxt_CausaleFermoMacchina_Traduzioni' AS full_olap_table_name,
    'PressDowntimeReasonTxtID = ' + CAST(COALESCE(inserted.PressDowntimeReasonTxtID, deleted.PressDowntimeReasonTxtID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

