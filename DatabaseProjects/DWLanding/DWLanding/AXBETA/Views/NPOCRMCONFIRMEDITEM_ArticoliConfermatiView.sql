
CREATE VIEW AXBETA.NPOCRMCONFIRMEDITEM_ArticoliConfermatiView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    PROJID,        -- IDTarga
    PRODLINEID,        -- Serie
    RECID,        -- PKArticoliConfermati

    -- Misure
    QTY,        -- QtaOrdine
    MQ,        -- QtaOrdineMQ
    KG,        -- QtaOrdineKg
    EURO        -- ImportoEuroOrdine

FROM [AXBETA\AXBETA].AX2009_METRA_BETA.dbo.NPOCRMCONFIRMEDITEM;
GO

