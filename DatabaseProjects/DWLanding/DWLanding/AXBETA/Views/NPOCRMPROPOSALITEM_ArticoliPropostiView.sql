
CREATE VIEW AXBETA.NPOCRMPROPOSALITEM_ArticoliPropostiView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    PROJID,        -- IDTarga
    PRODLINEID,        -- Serie
    RECID,        -- PKArticoliProposti

    -- Misure
    QTY,        -- QtaProposta
    MQ,        -- QtaPropostaMQ
    KG,        -- QtaPropostaKg
    EURO        -- ImportoEuroProposta

FROM [AXBETA\AXBETA].AX2009_METRA_BETA.dbo.NPOCRMPROPOSALITEM;
GO

