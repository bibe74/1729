
CREATE VIEW MES40MRAG.PressBatchClosingReason_CausaleChiusuraLottoView
AS
SELECT
    -- Chiavi
    PressBatchClosingReasonID,        -- PKCausaleChiusuraLotto

    -- Dimensioni
    Description COLLATE DATABASE_DEFAULT AS Description,        -- CausaleChiusuraLotto
    Result COLLATE DATABASE_DEFAULT AS Result        -- EsitoProduzione

FROM [SQL2014MRAG\SCADA2014].MES40_RDP.MasterData.PressBatchClosingReason;
GO

