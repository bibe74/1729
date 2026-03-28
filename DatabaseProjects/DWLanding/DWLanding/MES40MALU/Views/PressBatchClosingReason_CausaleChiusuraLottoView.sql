CREATE VIEW MES40MALU.PressBatchClosingReason_CausaleChiusuraLottoView
AS
SELECT
    -- Chiavi
    PressBatchClosingReasonID,        -- PKCausaleChiusuraLotto

    -- Dimensioni
    Description COLLATE DATABASE_DEFAULT AS Description,        -- CausaleChiusuraLotto
    Result COLLATE DATABASE_DEFAULT AS Result        -- EsitoProduzione

FROM [192.168.216.247\SCADA2017].MES40_RDP.MasterData.PressBatchClosingReason;
GO

