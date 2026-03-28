
CREATE PROCEDURE EDMSRV2016.usp_Merge_DocumentRevision_ProfiliIndustria
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'EDMSRV2016.DocumentRevision_ProfiliIndustria', N'U') IS NULL
BEGIN
	EXEC EDMSRV2016.usp_Create_DocumentRevision_ProfiliIndustria;
	EXEC EDMSRV2016.usp_AddIndexes_DocumentRevision_ProfiliIndustria;
END;

MERGE INTO EDMSRV2016.DocumentRevision_ProfiliIndustria AS TGT
USING EDMSRV2016.DocumentRevision_ProfiliIndustriaView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.DocumentID <> SRC.DocumentID OR TGT.Filename <> SRC.Filename OR TGT.DocumentTypeID <> SRC.DocumentTypeID OR TGT.RevisionNumber <> SRC.RevisionNumber OR TGT.IsLatestRevision <> SRC.IsLatestRevision OR TGT.StartDate <> SRC.StartDate OR TGT.ModificationDate <> SRC.ModificationDate)
  THEN UPDATE SET TGT.DocumentID = SRC.DocumentID, TGT.Filename = SRC.Filename, TGT.DocumentTypeID = SRC.DocumentTypeID, TGT.RevisionNumber = SRC.RevisionNumber, TGT.IsLatestRevision = SRC.IsLatestRevision, TGT.StartDate = SRC.StartDate, TGT.ModificationDate = SRC.ModificationDate
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, DocumentID, Filename, DocumentTypeID, RevisionNumber, IsLatestRevision, StartDate, ModificationDate)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'EDMSRV2016.DocumentRevision_ProfiliIndustria' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

