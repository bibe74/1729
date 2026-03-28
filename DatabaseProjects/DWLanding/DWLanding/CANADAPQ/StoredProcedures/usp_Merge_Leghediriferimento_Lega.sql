
CREATE PROCEDURE CANADAPQ.usp_Merge_Leghediriferimento_Lega
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'CANADAPQ.Leghediriferimento_Lega', N'U') IS NULL
BEGIN
	EXEC CANADAPQ.usp_Create_Leghediriferimento_Lega;
	EXEC CANADAPQ.usp_AddIndexes_Leghediriferimento_Lega;
END;

MERGE INTO CANADAPQ.Leghediriferimento_Lega AS TGT
USING CANADAPQ.Leghediriferimento_LegaView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.Lega <> SRC.Lega OR TGT.LegaSuAS400 <> SRC.LegaSuAS400)
  THEN UPDATE SET TGT.Lega = SRC.Lega, TGT.LegaSuAS400 = SRC.LegaSuAS400
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, Lega, LegaSuAS400)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'CANADAPQ.Leghediriferimento_Lega' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

