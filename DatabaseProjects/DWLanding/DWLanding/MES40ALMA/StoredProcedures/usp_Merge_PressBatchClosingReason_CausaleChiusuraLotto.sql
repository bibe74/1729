
CREATE PROCEDURE MES40ALMA.usp_Merge_PressBatchClosingReason_CausaleChiusuraLotto
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID('MES40ALMA.PressBatchClosingReason_CausaleChiusuraLotto', 'U') IS NULL
BEGIN
    EXEC MES40ALMA.usp_Create_PressBatchClosingReason_CausaleChiusuraLotto;
    EXEC MES40ALMA.usp_AddIndexes_PressBatchClosingReason_CausaleChiusuraLotto;
END;

MERGE INTO MES40ALMA.PressBatchClosingReason_CausaleChiusuraLotto AS TGT
USING MES40ALMA.PressBatchClosingReason_CausaleChiusuraLottoView (nolock) AS SRC
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
    'MES40ALMA.PressBatchClosingReason_CausaleChiusuraLotto' AS full_olap_table_name,
    'PressBatchClosingReasonID = ' + CAST(COALESCE(inserted.PressBatchClosingReasonID, deleted.PressBatchClosingReasonID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

