
CREATE VIEW MES40MSPA.BatchBillet_BilletteView
AS
SELECT
    -- Chiavi
    BB.BatchBilletID,        -- IDBilletta

    -- Dimensioni
    BB.BatchID COLLATE DATABASE_DEFAULT AS BatchID,        -- NumeroLotto
    BB.DieID COLLATE DATABASE_DEFAULT AS DieID,        -- CodiceBarraMatrice
    BB.PressReducedProdReasonID,        -- IDCausaleProduzioneRidotta
    --BilletNo,        -- NumeroBilletta
    COALESCE(BB.BilletNo, 0) AS BilletNo,        -- NumeroBilletta
    COALESCE(BB.StartTs, '19000101') AS StartTs,        -- TimeStart
    COALESCE(BB.StopTs, '19000101') AS StopTs,        -- TimeStop
    COALESCE(BB.SecCycle, 0) AS SecCycle,        -- SecondiCiclo
    COALESCE(BB.Billet1_CastingID, '') COLLATE DATABASE_DEFAULT AS Billet1_CastingID,        -- CodiceColata1
    COALESCE(BB.Billet2_CastingID, '') COLLATE DATABASE_DEFAULT AS Billet2_CastingID,        -- CodiceColata2
    COALESCE(BB.MmBilletAct, 0) AS MmBilletAct,        -- LunghezzaBillettaEstrusa
    COALESCE(BB.MmBarSet, 0.0) AS MmBarSet,        -- LunghezzaBarra
    COALESCE(BB.MmBilletBackAct, 0) AS MmBilletBackAct,        -- LunghezzaFondello
    COALESCE(BB.KgSheared, 0.0) AS KgSheared,        -- KgLordiPressa
    COALESCE(BB.KgExtruded, 0.0) AS KgExtruded,        -- KgEstrusi
    COALESCE(BB.KgItemMeter, 0.0) AS KgItemMeter,        -- PesoProfiloAlMetro
    COALESCE(BB.Billet1_AlloyID, '') COLLATE DATABASE_DEFAULT AS Billet1_AlloyID,        -- Lega1
    COALESCE(BB.Billet2_AlloyID, '') COLLATE DATABASE_DEFAULT AS Billet2_AlloyID,        -- Lega2
    COALESCE(BB.ShiftID, '') COLLATE DATABASE_DEFAULT AS ShiftID,        -- Turno
    COALESCE(BB.ShiftDate, '19000101') AS ShiftDate,        -- TurnoData
    COALESCE(BB.ShiftDate_Normalized, '19000101') AS ShiftDate_Normalized,        -- TurnoDataMetra
    COALESCE(BB.KgCut, 0.0) AS KgCut,        -- KgNettiTaglio
    COALESCE(BB.SecDowntime, 0) AS SecDowntime,        -- SecondiFermo
    COALESCE(BB.SecExtrusion, 0) AS SecExtrusion,        -- SecondiEstrusione
    COALESCE(BB.KgScrapShear, 0.0) AS KgScrapShear,        -- KgScartoCesoia
    COALESCE(BB.IsDieChange, 0) AS IsDieChange,        -- IsCambioMatrice
    COALESCE(BB.ClosingReasonID, 0) AS ClosingReasonID        -- IDCausaleChiusuraLotto

FROM [SQL2014\SCADA2014].MES40_RDP.BI.vBatchBillet BB;
GO

