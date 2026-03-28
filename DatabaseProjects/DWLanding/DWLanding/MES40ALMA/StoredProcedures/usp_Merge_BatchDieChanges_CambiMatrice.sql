
CREATE PROCEDURE MES40ALMA.usp_Merge_BatchDieChanges_CambiMatrice
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID('MES40ALMA.BatchDieChanges_CambiMatrice', 'U') IS NULL
BEGIN
    EXEC MES40ALMA.usp_Create_BatchDieChanges_CambiMatrice;
    EXEC MES40ALMA.usp_AddIndexes_BatchDieChanges_CambiMatrice;
END;

MERGE INTO MES40ALMA.BatchDieChanges_CambiMatrice AS TGT
USING MES40ALMA.BatchDieChanges_CambiMatriceView (nolock) AS SRC
ON SRC.BatchID = TGT.BatchID
WHEN MATCHED AND (TGT.DieChangeSeconds <> SRC.DieChangeSeconds)
  THEN UPDATE SET TGT.DieChangeSeconds = SRC.DieChangeSeconds
WHEN NOT MATCHED
  THEN INSERT VALUES (BatchID, DieChangeSeconds)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MES40ALMA.BatchDieChanges_CambiMatrice' AS full_olap_table_name,
    'BatchID = ' + CAST(COALESCE(inserted.BatchID, deleted.BatchID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

