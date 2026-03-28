
CREATE PROCEDURE MES40MSPA.usp_Merge_Press_Pressa
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID('MES40MSPA.Press_Pressa', 'U') IS NULL
BEGIN
    EXEC MES40MSPA.usp_Create_Press_Pressa;
    EXEC MES40MSPA.usp_AddIndexes_Press_Pressa;
END;

MERGE INTO MES40MSPA.Press_Pressa AS TGT
USING MES40MSPA.Press_PressaView (nolock) AS SRC
ON SRC.PressID = TGT.PressID
WHEN MATCHED AND (TGT.Description <> SRC.Description)
  THEN UPDATE SET TGT.Description = SRC.Description
WHEN NOT MATCHED
  THEN INSERT VALUES (PressID, Description)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MES40MSPA.Press_Pressa' AS full_olap_table_name,
    'PressID = ' + CAST(COALESCE(inserted.PressID, deleted.PressID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

