
CREATE VIEW AX2009.WMSORDER_OrdiniMagazzinoView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    ORDERID,        -- OrdineMagazzino
    RECID,        -- PKOrdiniMagazzino

    -- Dimensioni
    INVENTTRANSID,        -- IDGruppoTransazioni
    ITEMID,        -- IDArticoloConfigurato
    INVENTDIMID,        -- IDDimensioneInventariale
    STATUS,        -- IDStato [enum WMSOrderStatus]

    -- Misure
    QTY        -- Qta

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.WMSORDER;
GO

