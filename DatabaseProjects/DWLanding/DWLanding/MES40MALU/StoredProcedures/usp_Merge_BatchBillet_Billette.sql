
CREATE PROCEDURE MES40MALU.usp_Merge_BatchBillet_Billette
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MES40MALU.BatchBillet_Billette', N'U') IS NULL
BEGIN
    EXEC MES40MALU.usp_Create_BatchBillet_Billette;
    EXEC MES40MALU.usp_AddIndexes_BatchBillet_Billette;
END;

MERGE INTO MES40MALU.BatchBillet_Billette AS TGT
USING MES40MALU.BatchBillet_BilletteView (nolock) AS SRC
ON SRC.BatchBilletID = TGT.BatchBilletID
WHEN MATCHED AND (TGT.BatchID <> SRC.BatchID OR TGT.DieID <> SRC.DieID OR TGT.PressReducedProdReasonID <> SRC.PressReducedProdReasonID OR TGT.BilletNo <> SRC.BilletNo OR TGT.StartTs <> SRC.StartTs OR TGT.StopTs <> SRC.StopTs OR TGT.SecCycle <> SRC.SecCycle OR TGT.Billet1_CastingID <> SRC.Billet1_CastingID OR TGT.Billet2_CastingID <> SRC.Billet2_CastingID OR TGT.MmBilletAct <> SRC.MmBilletAct OR TGT.MmBarSet <> SRC.MmBarSet OR TGT.MmBilletBackAct <> SRC.MmBilletBackAct OR TGT.KgSheared <> SRC.KgSheared OR TGT.KgExtruded <> SRC.KgExtruded OR TGT.KgItemMeter <> SRC.KgItemMeter OR TGT.Billet1_AlloyID <> SRC.Billet1_AlloyID OR TGT.Billet2_AlloyID <> SRC.Billet2_AlloyID OR TGT.ShiftID <> SRC.ShiftID OR TGT.ShiftDate <> SRC.ShiftDate OR TGT.ShiftDate_Normalized <> SRC.ShiftDate_Normalized OR TGT.KgCut <> SRC.KgCut OR TGT.SecDowntime <> SRC.SecDowntime OR TGT.SecExtrusion <> SRC.SecExtrusion OR TGT.KgScrapShear <> SRC.KgScrapShear OR TGT.IsDieChange <> SRC.IsDieChange OR TGT.ClosingReasonID <> SRC.ClosingReasonID)
  THEN UPDATE SET TGT.BatchID = SRC.BatchID, TGT.DieID = SRC.DieID, TGT.PressReducedProdReasonID = SRC.PressReducedProdReasonID, TGT.BilletNo = SRC.BilletNo, TGT.StartTs = SRC.StartTs, TGT.StopTs = SRC.StopTs, TGT.SecCycle = SRC.SecCycle, TGT.Billet1_CastingID = SRC.Billet1_CastingID, TGT.Billet2_CastingID = SRC.Billet2_CastingID, TGT.MmBilletAct = SRC.MmBilletAct, TGT.MmBarSet = SRC.MmBarSet, TGT.MmBilletBackAct = SRC.MmBilletBackAct, TGT.KgSheared = SRC.KgSheared, TGT.KgExtruded = SRC.KgExtruded, TGT.KgItemMeter = SRC.KgItemMeter, TGT.Billet1_AlloyID = SRC.Billet1_AlloyID, TGT.Billet2_AlloyID = SRC.Billet2_AlloyID, TGT.ShiftID = SRC.ShiftID, TGT.ShiftDate = SRC.ShiftDate, TGT.ShiftDate_Normalized = SRC.ShiftDate_Normalized, TGT.KgCut = SRC.KgCut, TGT.SecDowntime = SRC.SecDowntime, TGT.SecExtrusion = SRC.SecExtrusion, TGT.KgScrapShear = SRC.KgScrapShear, TGT.IsDieChange = SRC.IsDieChange, TGT.ClosingReasonID = SRC.ClosingReasonID
WHEN NOT MATCHED
  THEN INSERT VALUES (BatchBilletID, BatchID, DieID, PressReducedProdReasonID, BilletNo, StartTs, StopTs, SecCycle, Billet1_CastingID, Billet2_CastingID, MmBilletAct, MmBarSet, MmBilletBackAct, KgSheared, KgExtruded, KgItemMeter, Billet1_AlloyID, Billet2_AlloyID, ShiftID, ShiftDate, ShiftDate_Normalized, KgCut, SecDowntime, SecExtrusion, KgScrapShear, IsDieChange, ClosingReasonID)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MES40MALU.BatchBillet_Billette' AS full_olap_table_name,
    'BatchBilletID = ' + CAST(COALESCE(inserted.BatchBilletID, deleted.BatchBilletID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

