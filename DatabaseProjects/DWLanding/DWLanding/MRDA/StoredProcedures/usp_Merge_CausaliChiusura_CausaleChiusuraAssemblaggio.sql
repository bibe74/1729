
CREATE PROCEDURE MRDA.usp_Merge_CausaliChiusura_CausaleChiusuraAssemblaggio
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDA.CausaliChiusura_CausaleChiusuraAssemblaggio', N'U') IS NULL
BEGIN
	EXEC MRDA.usp_Create_CausaliChiusura_CausaleChiusuraAssemblaggio;
	EXEC MRDA.usp_AddIndexes_CausaliChiusura_CausaleChiusuraAssemblaggio;
END;

MERGE INTO MRDA.CausaliChiusura_CausaleChiusuraAssemblaggio AS TGT
USING MRDA.CausaliChiusura_CausaleChiusuraAssemblaggioView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.Descrizione <> SRC.Descrizione)
  THEN UPDATE SET TGT.Descrizione = SRC.Descrizione
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, Descrizione)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'MRDA.CausaliChiusura_CausaleChiusuraAssemblaggio' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

