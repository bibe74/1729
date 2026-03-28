
CREATE VIEW MES40RAW.Batch_LottiVerniciaturaView
AS
SELECT
    -- Chiavi
    BatchID,        -- NumeroLotto

    -- Dimensioni
    COALESCE(BatchStartTs, CAST('19000101' AS DATETIME2)) AS BatchStartTs,        -- DataOraInizio
    COALESCE(BatchStatusID, -1) AS BatchStatusID,        -- IDStato
    COALESCE(BatchStopTs, CAST('19000101' AS DATETIME2)) AS BatchStopTs,        -- DataOraFine
    COALESCE(BatchTypeID, '') AS BatchTypeID,        -- IDTipoLotto
    IsClosed,        -- IsChiuso
    IsDeleted,        -- IsEliminato
    PaintFinishingID,        -- IDFinitura
    PaintingAreaID,        -- IDLineaVerniciatura
    COALESCE(PaintingLineID, N'') AS PaintingLineID,        -- IDCabinaVerniciatura
    TagFinishingID        -- IDFinituraCartellino

FROM [SQL2014\SCADA2014].MES40_RAW.Painting.Batch;
GO

