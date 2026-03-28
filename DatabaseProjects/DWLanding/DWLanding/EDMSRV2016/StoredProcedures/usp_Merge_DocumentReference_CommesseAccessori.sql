
CREATE PROCEDURE EDMSRV2016.usp_Merge_DocumentReference_CommesseAccessori
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'EDMSRV2016.DocumentReference_CommesseAccessori', N'U') IS NULL
BEGIN
    EXEC EDMSRV2016.usp_Create_DocumentReference_CommesseAccessori;
    EXEC EDMSRV2016.usp_AddIndexes_DocumentReference_CommesseAccessori;
END;

MERGE INTO EDMSRV2016.DocumentReference_CommesseAccessori AS TGT
USING EDMSRV2016.DocumentReference_CommesseAccessoriView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.SourceID <> SRC.SourceID OR TGT.TargetID <> SRC.TargetID OR TGT.ReferenceTypeID <> SRC.ReferenceTypeID)
  THEN UPDATE SET TGT.SourceID = SRC.SourceID, TGT.TargetID = SRC.TargetID, TGT.ReferenceTypeID = SRC.ReferenceTypeID
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, SourceID, TargetID, ReferenceTypeID)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'EDMSRV2016.DocumentReference_CommesseAccessori' AS full_olap_table_name,
    'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

