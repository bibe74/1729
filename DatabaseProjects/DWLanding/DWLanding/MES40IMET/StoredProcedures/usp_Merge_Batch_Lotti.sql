
CREATE PROCEDURE MES40IMET.usp_Merge_Batch_Lotti
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MES40IMET.Batch_Lotti', N'U') IS NULL
BEGIN
    EXEC MES40IMET.usp_Create_Batch_Lotti;
    EXEC MES40IMET.usp_AddIndexes_Batch_Lotti;
END;

MERGE INTO MES40IMET.Batch_Lotti AS TGT
USING MES40IMET.Batch_LottiView (nolock) AS SRC
ON SRC.BatchID = TGT.BatchID
WHEN MATCHED AND (TGT.PressID <> SRC.PressID OR TGT.DieID <> SRC.DieID OR TGT.DieStatusID <> SRC.DieStatusID OR TGT.DieCode <> SRC.DieCode OR TGT.DieNumber <> SRC.DieNumber OR TGT.StartTs <> SRC.StartTs OR TGT.StopTs <> SRC.StopTs OR TGT.ItemMeterWeight_MasterData <> SRC.ItemMeterWeight_MasterData OR TGT.ItemMeterWeight_Mes <> SRC.ItemMeterWeight_Mes OR TGT.ItemMeterWeight_Test <> SRC.ItemMeterWeight_Test OR TGT.ItemMeterWeight <> SRC.ItemMeterWeight OR TGT.IsPressClosed <> SRC.IsPressClosed OR TGT.PressClosedTs <> SRC.PressClosedTs OR TGT.IsSawClosed <> SRC.IsSawClosed OR TGT.SawClosedTs <> SRC.SawClosedTs OR TGT.CustAccount <> SRC.CustAccount OR TGT.BilletFirstNo <> SRC.BilletFirstNo OR TGT.KgRaw <> SRC.KgRaw OR TGT.KgSheared <> SRC.KgSheared OR TGT.KgExtruded <> SRC.KgExtruded OR TGT.KgCut <> SRC.KgCut OR TGT.KgScrapShear <> SRC.KgScrapShear OR TGT.KgScrapPress <> SRC.KgScrapPress OR TGT.KgScrapSaw <> SRC.KgScrapSaw OR TGT.IsSampling <> SRC.IsSampling OR TGT.IsErpImported <> SRC.IsErpImported OR TGT.PressBatchClosingReasonID <> SRC.PressBatchClosingReasonID OR TGT.BarCount <> SRC.BarCount OR TGT.ModuleCount <> SRC.ModuleCount OR TGT.BilletDiameter <> SRC.BilletDiameter)
  THEN UPDATE SET TGT.PressID = SRC.PressID, TGT.DieID = SRC.DieID, TGT.DieStatusID = SRC.DieStatusID, TGT.DieCode = SRC.DieCode, TGT.DieNumber = SRC.DieNumber, TGT.StartTs = SRC.StartTs, TGT.StopTs = SRC.StopTs, TGT.ItemMeterWeight_MasterData = SRC.ItemMeterWeight_MasterData, TGT.ItemMeterWeight_Mes = SRC.ItemMeterWeight_Mes, TGT.ItemMeterWeight_Test = SRC.ItemMeterWeight_Test, TGT.ItemMeterWeight = SRC.ItemMeterWeight, TGT.IsPressClosed = SRC.IsPressClosed, TGT.PressClosedTs = SRC.PressClosedTs, TGT.IsSawClosed = SRC.IsSawClosed, TGT.SawClosedTs = SRC.SawClosedTs, TGT.CustAccount = SRC.CustAccount, TGT.BilletFirstNo = SRC.BilletFirstNo, TGT.KgRaw = SRC.KgRaw, TGT.KgSheared = SRC.KgSheared, TGT.KgExtruded = SRC.KgExtruded, TGT.KgCut = SRC.KgCut, TGT.KgScrapShear = SRC.KgScrapShear, TGT.KgScrapPress = SRC.KgScrapPress, TGT.KgScrapSaw = SRC.KgScrapSaw, TGT.IsSampling = SRC.IsSampling, TGT.IsErpImported = SRC.IsErpImported, TGT.PressBatchClosingReasonID = SRC.PressBatchClosingReasonID, TGT.BarCount = SRC.BarCount, TGT.ModuleCount = SRC.ModuleCount, TGT.BilletDiameter = SRC.BilletDiameter
WHEN NOT MATCHED
  THEN INSERT VALUES (BatchID, PressID, DieID, DieStatusID, DieCode, DieNumber, StartTs, StopTs, ItemMeterWeight_MasterData, ItemMeterWeight_Mes, ItemMeterWeight_Test, ItemMeterWeight, IsPressClosed, PressClosedTs, IsSawClosed, SawClosedTs, CustAccount, BilletFirstNo, KgRaw, KgSheared, KgExtruded, KgCut, KgScrapShear, KgScrapPress, KgScrapSaw, IsSampling, IsErpImported, PressBatchClosingReasonID, BarCount, ModuleCount, BilletDiameter)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MES40IMET.Batch_Lotti' AS full_olap_table_name,
    'BatchID = ' + CAST(COALESCE(inserted.BatchID, deleted.BatchID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

