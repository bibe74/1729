
CREATE PROCEDURE RRDP.usp_Merge_Presse_Pressa
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'RRDP.Presse_Pressa', N'U') IS NULL
BEGIN
	EXEC RRDP.usp_Create_Presse_Pressa;
	EXEC RRDP.usp_AddIndexes_Presse_Pressa;
END;

MERGE INTO RRDP.Presse_Pressa AS TGT
USING RRDP.Presse_PressaView (nolock) AS SRC
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
	'RRDP.Presse_Pressa' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

