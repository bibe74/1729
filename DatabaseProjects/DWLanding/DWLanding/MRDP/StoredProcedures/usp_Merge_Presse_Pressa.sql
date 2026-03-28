
CREATE PROCEDURE MRDP.usp_Merge_Presse_Pressa
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDP.Presse_Pressa', N'U') IS NULL
BEGIN
	EXEC MRDP.usp_Create_Presse_Pressa;
	EXEC MRDP.usp_AddIndexes_Presse_Pressa;
END;

MERGE INTO MRDP.Presse_Pressa AS TGT
USING MRDP.Presse_PressaView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.IDPressaAs400 <> SRC.IDPressaAs400 OR TGT.Descrizione <> SRC.Descrizione)
  THEN UPDATE SET TGT.IDPressaAs400 = SRC.IDPressaAs400, TGT.Descrizione = SRC.Descrizione
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, IDPressaAs400, Descrizione)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'MRDP.Presse_Pressa' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

