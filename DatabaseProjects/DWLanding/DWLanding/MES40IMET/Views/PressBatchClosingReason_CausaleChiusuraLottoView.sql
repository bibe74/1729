
CREATE VIEW MES40IMET.PressBatchClosingReason_CausaleChiusuraLottoView
AS
SELECT
    -- Chiavi
    PressBatchClosingReasonID,        -- PKCausaleChiusuraLotto

    -- Dimensioni
    Description COLLATE DATABASE_DEFAULT AS Description,        -- CausaleChiusuraLotto
    Result COLLATE DATABASE_DEFAULT AS Result        -- EsitoProduzione

FROM [SQL2012IMET\SCADA2012].MES40_RDP.MasterData.PressBatchClosingReason;
GO

