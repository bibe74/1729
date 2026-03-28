
CREATE PROCEDURE MRDP.usp_Merge_CaricamentoBillettePressa_Carico_CaricoBillette
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDP.CaricamentoBillettePressa_Carico_CaricoBillette', N'U') IS NULL
BEGIN
    EXEC MRDP.usp_Create_CaricamentoBillettePressa_Carico_CaricoBillette;
    EXEC MRDP.usp_AddIndexes_CaricamentoBillettePressa_Carico_CaricoBillette;
END;

MERGE INTO MRDP.CaricamentoBillettePressa_Carico_CaricoBillette AS TGT
USING MRDP.CaricamentoBillettePressa_Carico_CaricoBilletteView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.Ingresso <> SRC.Ingresso)
  THEN UPDATE SET TGT.Ingresso = SRC.Ingresso
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, Ingresso)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MRDP.CaricamentoBillettePressa_Carico_CaricoBillette' AS full_olap_table_name,
    'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

