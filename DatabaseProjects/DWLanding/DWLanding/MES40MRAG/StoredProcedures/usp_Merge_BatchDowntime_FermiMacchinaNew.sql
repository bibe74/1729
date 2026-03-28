
CREATE PROCEDURE MES40MRAG.usp_Merge_BatchDowntime_FermiMacchinaNew
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID('MES40MRAG.BatchDowntime_FermiMacchinaNew', 'U') IS NULL
BEGIN
    EXEC MES40MRAG.usp_Create_BatchDowntime_FermiMacchinaNew;
    EXEC MES40MRAG.usp_AddIndexes_BatchDowntime_FermiMacchinaNew;
END;

MERGE INTO MES40MRAG.BatchDowntime_FermiMacchinaNew AS TGT
USING MES40MRAG.BatchDowntime_FermiMacchinaNewView (nolock) AS SRC
ON SRC.PKBatchDowntime = TGT.PKBatchDowntime
WHEN MATCHED AND (TGT.DowntimeType <> SRC.DowntimeType OR TGT.PressID <> SRC.PressID OR TGT.DataTurno <> SRC.DataTurno OR TGT.IDTurno <> SRC.IDTurno OR TGT.Turno <> SRC.Turno OR COALESCE(TGT.DowntimeReasonID, -1) <> COALESCE(SRC.DowntimeReasonID, -1) OR COALESCE(TGT.MicroDowntimeReasonID, -1) <> COALESCE(SRC.MicroDowntimeReasonID, -1) OR TGT.IsGuasto <> SRC.IsGuasto OR TGT.IsInceppamento <> SRC.IsInceppamento OR TGT.DurataSecondi <> SRC.DurataSecondi OR TGT.NumeroFermi <> SRC.NumeroFermi)
  THEN UPDATE SET TGT.DowntimeType = SRC.DowntimeType, TGT.PressID = SRC.PressID, TGT.DataTurno = SRC.DataTurno, TGT.IDTurno = SRC.IDTurno, TGT.Turno = SRC.Turno, TGT.DowntimeReasonID = SRC.DowntimeReasonID, TGT.MicroDowntimeReasonID = SRC.MicroDowntimeReasonID, TGT.IsGuasto = SRC.IsGuasto, TGT.IsInceppamento = SRC.IsInceppamento, TGT.DurataSecondi = SRC.DurataSecondi, TGT.NumeroFermi = SRC.NumeroFermi
WHEN NOT MATCHED
  THEN INSERT VALUES (PKBatchDowntime, DowntimeType, PressID, DataTurno, IDTurno, Turno, DowntimeReasonID, MicroDowntimeReasonID, IsGuasto, IsInceppamento, DurataSecondi, NumeroFermi)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MES40MRAG.BatchDowntime_FermiMacchinaNew' AS full_olap_table_name,
    'PKBatchDowntime = ' + CAST(COALESCE(inserted.PKBatchDowntime, deleted.PKBatchDowntime) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

