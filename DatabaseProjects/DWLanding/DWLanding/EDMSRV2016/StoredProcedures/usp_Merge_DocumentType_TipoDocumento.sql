
CREATE PROCEDURE EDMSRV2016.usp_Merge_DocumentType_TipoDocumento
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'EDMSRV2016.DocumentType_TipoDocumento', N'U') IS NULL
BEGIN
	EXEC EDMSRV2016.usp_Create_DocumentType_TipoDocumento;
	EXEC EDMSRV2016.usp_AddIndexes_DocumentType_TipoDocumento;
END;

MERGE INTO EDMSRV2016.DocumentType_TipoDocumento AS TGT
USING EDMSRV2016.DocumentType_TipoDocumentoView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.Name <> SRC.Name OR TGT.DisplayName <> SRC.DisplayName)
  THEN UPDATE SET TGT.Name = SRC.Name, TGT.DisplayName = SRC.DisplayName
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, Name, DisplayName)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'EDMSRV2016.DocumentType_TipoDocumento' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

