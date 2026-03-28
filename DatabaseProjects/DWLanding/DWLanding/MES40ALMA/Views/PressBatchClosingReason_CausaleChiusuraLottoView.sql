
CREATE VIEW MES40ALMA.PressBatchClosingReason_CausaleChiusuraLottoView
AS
SELECT
    -- Chiavi
    PressBatchClosingReasonID,        -- PKCausaleChiusuraLotto

    -- Dimensioni
    Description COLLATE DATABASE_DEFAULT AS Description,        -- CausaleChiusuraLotto
    Result COLLATE DATABASE_DEFAULT AS Result        -- EsitoProduzione

FROM [192.168.216.247\SCADA2017].ALMA_MES40_RDP.MasterData.PressBatchClosingReason;
GO

