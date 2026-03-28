
CREATE PROCEDURE EDMSRV2016.usp_Merge_Folder_Cartella
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'EDMSRV2016.Folder_Cartella', N'U') IS NULL
BEGIN
    EXEC EDMSRV2016.usp_Create_Folder_Cartella;
    EXEC EDMSRV2016.usp_AddIndexes_Folder_Cartella;
END;

MERGE INTO EDMSRV2016.Folder_Cartella AS TGT
USING EDMSRV2016.Folder_CartellaView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.ParentID <> SRC.ParentID OR TGT.Name <> SRC.Name)
  THEN UPDATE SET TGT.ParentID = SRC.ParentID, TGT.Name = SRC.Name
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, ParentID, Name)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'EDMSRV2016.Folder_Cartella' AS full_olap_table_name,
    'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

