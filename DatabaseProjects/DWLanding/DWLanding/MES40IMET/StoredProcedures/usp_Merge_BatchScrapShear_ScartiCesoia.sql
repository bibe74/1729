
CREATE PROCEDURE MES40IMET.usp_Merge_BatchScrapShear_ScartiCesoia
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MES40IMET.BatchScrapShear_ScartiCesoia', N'U') IS NULL
BEGIN
    EXEC MES40IMET.usp_Create_BatchScrapShear_ScartiCesoia;
    EXEC MES40IMET.usp_AddIndexes_BatchScrapShear_ScartiCesoia;
END;

MERGE INTO MES40IMET.BatchScrapShear_ScartiCesoia AS TGT
USING MES40IMET.BatchScrapShear_ScartiCesoiaView (nolock) AS SRC
ON SRC.BatchScrapShearID = TGT.BatchScrapShearID
WHEN MATCHED AND (TGT.Ts <> SRC.Ts OR TGT.BatchID <> SRC.BatchID OR TGT.KgScrapShear <> SRC.KgScrapShear OR TGT.IsManualScrap <> SRC.IsManualScrap)
  THEN UPDATE SET TGT.Ts = SRC.Ts, TGT.BatchID = SRC.BatchID, TGT.KgScrapShear = SRC.KgScrapShear, TGT.IsManualScrap = SRC.IsManualScrap
WHEN NOT MATCHED
  THEN INSERT VALUES (BatchScrapShearID, Ts, BatchID, KgScrapShear, IsManualScrap)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MES40IMET.BatchScrapShear_ScartiCesoia' AS full_olap_table_name,
    'BatchScrapShearID = ' + CAST(COALESCE(inserted.BatchScrapShearID, deleted.BatchScrapShearID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

