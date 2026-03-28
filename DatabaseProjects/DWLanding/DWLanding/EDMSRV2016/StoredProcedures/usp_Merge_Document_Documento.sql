
CREATE PROCEDURE EDMSRV2016.usp_Merge_Document_Documento
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'EDMSRV2016.Document_Documento', N'U') IS NULL
BEGIN
	EXEC EDMSRV2016.usp_Create_Document_Documento;
	EXEC EDMSRV2016.usp_AddIndexes_Document_Documento;
END;

MERGE INTO EDMSRV2016.Document_Documento AS TGT
USING EDMSRV2016.Document_DocumentoView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.FolderID <> SRC.FolderID)
  THEN UPDATE SET TGT.FolderID = SRC.FolderID
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, FolderID)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'EDMSRV2016.Document_Documento' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

