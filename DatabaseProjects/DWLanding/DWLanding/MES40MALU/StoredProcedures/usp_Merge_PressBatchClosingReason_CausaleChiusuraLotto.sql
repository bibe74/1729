
CREATE PROCEDURE MES40MALU.usp_Merge_PressBatchClosingReason_CausaleChiusuraLotto
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MES40MALU.PressBatchClosingReason_CausaleChiusuraLotto', N'U') IS NULL
BEGIN
    EXEC MES40MALU.usp_Create_PressBatchClosingReason_CausaleChiusuraLotto;
    EXEC MES40MALU.usp_AddIndexes_PressBatchClosingReason_CausaleChiusuraLotto;
END;

MERGE INTO MES40MALU.PressBatchClosingReason_CausaleChiusuraLotto AS TGT
USING MES40MALU.PressBatchClosingReason_CausaleChiusuraLottoView (nolock) AS SRC
ON SRC.PressBatchClosingReasonID = TGT.PressBatchClosingReasonID
WHEN MATCHED AND (TGT.Description <> SRC.Description OR TGT.Result <> SRC.Result)
  THEN UPDATE SET TGT.Description = SRC.Description, TGT.Result = SRC.Result
WHEN NOT MATCHED
  THEN INSERT VALUES (PressBatchClosingReasonID, Description, Result)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MES40MALU.PressBatchClosingReason_CausaleChiusuraLotto' AS full_olap_table_name,
    'PressBatchClosingReasonID = ' + CAST(COALESCE(inserted.PressBatchClosingReasonID, deleted.PressBatchClosingReasonID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

