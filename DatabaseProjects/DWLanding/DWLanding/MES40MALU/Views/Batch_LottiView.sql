
CREATE VIEW MES40MALU.Batch_LottiView
AS
SELECT
    -- Chiavi
    BatchID COLLATE DATABASE_DEFAULT AS BatchID,        -- NumeroLotto

    -- Dimensioni
    PressID COLLATE DATABASE_DEFAULT AS PressID,        -- IDPressa
    DieID COLLATE DATABASE_DEFAULT AS DieID,        -- CodiceBarraMatrice
    DieStatusID COLLATE DATABASE_DEFAULT AS DieStatusID,        -- StatoMatice
    DieCode COLLATE DATABASE_DEFAULT AS DieCode,        -- CodiceMatrice
    DieNumber,        -- BarraMatrice
    CONVERT(DATETIME, StartTs) AS StartTs,        -- TimeStart
    CONVERT(DATETIME, StopTs) AS StopTs,        -- TimeStop
    ItemMeterWeight_MasterData,        -- PesoProfiloAlMetroAnagrafica
    ItemMeterWeight_Mes,        -- PesoProfiloAlMetroScada
    ItemMeterWeight_Test,        -- PesoProfiloAlMetroCollaudo
    ItemMeterWeight,        -- PesoProfiloAlMetro
    IsPressClosed,        -- ChiusuraLotto
    CONVERT(DATETIME, CASE WHEN IsPressClosed = 1 THEN COALESCE(PressClosedTs, StopTs) ELSE PressClosedTs END) AS PressClosedTs,        -- ChiusuraLottoDataOra
    IsSawClosed,        -- ChiusuraIncestamento
    CONVERT(DATETIME, SawClosedTs) AS SawClosedTs,        -- ChiusuraIncestamentoDataOra
    CustAccount COLLATE DATABASE_DEFAULT AS CustAccount,        -- CodiceCliente
    BilletFirstNo,        -- PrimaBilletta
    KgRaw,        -- KgConsumati
    KgSheared,        -- KgLordiPressa
    KgExtruded,        -- KgEstrusi
    KgCut,        -- KgTagliati
    KgScrapShear,        -- KgScartoCesoia
    KgScrapPress,        -- KgScartoPressa
    KgScrapSaw,        -- KgScartoTaglierina
    IsSampling,        -- Campionatura
    IsErpImported,        -- IsRiconciliato
    PressBatchClosingReasonID,        -- IDCausaleChiusuraLotto
    BarCount,        -- BarreTagliate
    ModuleCount,        -- NumeroCeste
    BilletDiameter        -- DiametroBilletta

FROM [192.168.216.247\SCADA2017].MES40_RDP.BI.vBatch;
GO

