
CREATE PROCEDURE MRDP.usp_Merge_CaricamentoBillettePressa_MagazzinoMovimenti_MovimentiBillette
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDP.CaricamentoBillettePressa_MagazzinoMovimenti_MovimentiBillette', N'U') IS NULL
BEGIN
    EXEC MRDP.usp_Create_CaricamentoBillettePressa_MagazzinoMovimenti_MovimentiBillette;
    EXEC MRDP.usp_AddIndexes_CaricamentoBillettePressa_MagazzinoMovimenti_MovimentiBillette;
END;

MERGE INTO MRDP.CaricamentoBillettePressa_MagazzinoMovimenti_MovimentiBillette AS TGT
USING MRDP.CaricamentoBillettePressa_MagazzinoMovimenti_MovimentiBilletteView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.Colata <> SRC.Colata OR TGT.TipoAzione <> SRC.TipoAzione OR TGT.DataAzione <> SRC.DataAzione OR TGT.IDScaricoBilletta <> SRC.IDScaricoBilletta OR TGT.IDCaricoBilletta <> SRC.IDCaricoBilletta OR TGT.Qta <> SRC.Qta)
  THEN UPDATE SET TGT.Colata = SRC.Colata, TGT.TipoAzione = SRC.TipoAzione, TGT.DataAzione = SRC.DataAzione, TGT.IDScaricoBilletta = SRC.IDScaricoBilletta, TGT.IDCaricoBilletta = SRC.IDCaricoBilletta, TGT.Qta = SRC.Qta
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, Colata, TipoAzione, DataAzione, IDScaricoBilletta, IDCaricoBilletta, Qta)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MRDP.CaricamentoBillettePressa_MagazzinoMovimenti_MovimentiBillette' AS full_olap_table_name,
    'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

