
CREATE VIEW MES40RAW.PaintingTrans_TransazioniVerniciaturaView
AS
SELECT
    -- Chiavi
    PaintingTransID,        -- PKTransazioniVerniciatura

    -- Dimensioni
    BarLength,        -- LunghezzaBarra
    BatchID,        -- NumeroLotto
    CreatedTs,        -- DataOraCreazione
    IsPacked,        -- IsImballato
    ItemID,        -- IDArticoloConfigurato
    COALESCE(PackedTs, CAST('19000101' AS DATETIME2)) AS PackedTs,        -- DataOraImballo
    COALESCE(PackQty, 0) AS PackQty,        -- QtaImballata
    PaintFinishingID,        -- IDFinitura
    ProdID,        -- OrdineProduzione
    Qty,        -- Qta
    COALESCE(ScrapQty, 0) AS ScrapQty,       -- QtaScartata
    ShiftDate,        -- DataTurno
    ShiftID,        -- IDTurno
    TagFinishingID,        -- IDFinituraCartellino
    COALESCE(WrkCtrID, N'') AS WrkCtrID,        -- IDCentroDiLavoro
    ModuleID        -- NumeroPacco

FROM [SQL2014\SCADA2014].MES40_RAW.Painting.PaintingTrans;
GO

