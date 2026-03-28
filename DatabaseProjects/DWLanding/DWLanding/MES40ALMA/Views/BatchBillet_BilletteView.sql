
CREATE VIEW MES40ALMA.BatchBillet_BilletteView
AS
SELECT
    -- Chiavi
    BB.BatchBilletID,        -- IDBilletta

    -- Dimensioni
    BB.BatchID COLLATE DATABASE_DEFAULT AS BatchID,        -- NumeroLotto
    BB.DieID COLLATE DATABASE_DEFAULT AS DieID,        -- CodiceBarraMatrice
    BB.PressReducedProdReasonID,        -- IDCausaleProduzioneRidotta
    --BilletNo,        -- NumeroBilletta
    BB.BilletNo,        -- NumeroBilletta
    BB.StartTs,        -- TimeStart
    BB.StopTs,        -- TimeStop
    BB.SecCycle,        -- SecondiCiclo
    BB.Billet1_CastingID COLLATE DATABASE_DEFAULT AS Billet1_CastingID,        -- CodiceColata1
    BB.Billet2_CastingID COLLATE DATABASE_DEFAULT AS Billet2_CastingID,        -- CodiceColata2
    BB.MmBilletAct,        -- LunghezzaBillettaEstrusa
    BB.MmBarSet,        -- LunghezzaBarra
    BB.MmBilletBackAct,        -- LunghezzaFondello
    BB.KgSheared,        -- KgLordiPressa
    BB.KgExtruded,        -- KgEstrusi
    BB.KgItemMeter,        -- PesoProfiloAlMetro
    BB.Billet1_AlloyID COLLATE DATABASE_DEFAULT AS Billet1_AlloyID,        -- Lega1
    BB.Billet2_AlloyID COLLATE DATABASE_DEFAULT AS Billet2_AlloyID,        -- Lega2
    BB.ShiftID COLLATE DATABASE_DEFAULT AS ShiftID,        -- Turno
    BB.ShiftDate,        -- TurnoData
    BB.ShiftDate_Normalized,        -- TurnoDataMetra
    BB.KgCut,        -- KgNettiTaglio
    BB.SecDowntime,        -- SecondiFermo
    BB.SecExtrusion,        -- SecondiEstrusione
    BB.KgScrapShear,        -- KgScartoCesoia
    BB.IsDieChange,        -- IsCambioMatrice
    BB.ClosingReasonID        -- IDCausaleChiusuraLotto

FROM [192.168.216.247\SCADA2017].ALMA_MES40_RDP.BI.vBatchBillet BB;
GO

