
CREATE VIEW AX2009.NPOSALESLINEWMSPALLETLINK_OrdiniCliente_Riga_DatiPalletView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    INVENTTRANSID,        -- IDGruppoTransazioni
    DELIVERYDATE,        -- DataDDT
    PACKINGSLIPID,        -- NumeroDDT
    WMSPALLETID,        -- IDPallet
    RECID,        -- PKOrdiniCliente_Riga_DatiPallet

    -- Dimensioni
    COMPANYSALESID,        -- IDAziendaIntercompany
    INTERCOMPANYSALESID,        -- OrdineClienteIntercompany
    ITEMID,        -- IDArticoloConfigurato

    -- Misure
    QTY,        -- Qta
    QTY2UM,        -- QtaKg
    PACKEDQTY,        -- QtaImballata
    PACKEDQTY2UM        -- QtaKgImballati

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOSALESLINEWMSPALLETLINK;
GO

