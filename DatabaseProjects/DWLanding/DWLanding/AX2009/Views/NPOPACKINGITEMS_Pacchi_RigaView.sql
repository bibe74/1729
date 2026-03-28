
CREATE VIEW AX2009.NPOPACKINGITEMS_Pacchi_RigaView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    PACKINGID,        -- NumeroPacco
    SALESLINENUM,        -- NumeroRiga
    RECID,        -- PKPacchi_Riga

    -- Dimensioni
    SALESID,        -- OrdineCliente
    BARLENGTH,        -- LunghezzaBarra
    ITEMID,        -- IDArticoloConfigurato
    WMSORDERTRANSRECID,        -- PKOrdiniMagazzino_Riga
    INVENTREFID,        -- NumeroRiferimento
    INVENTREFTYPE,        -- IDTipoRiferimento [enum InventRefType]
    SALESLINERECID,        -- PKOrdiniCliente_Riga
    PURCHLINERECID,        -- PKOrdiniFornitore_Riga
    INVENTTRANSID,        -- IDGruppoTransazioni
    BOMITEMID,        -- IDArticoloConfiguratoGrezzo
    PAINTINGTHICKNESS,        -- SpessoreVerniciatura

    -- Misure
    SALESUNIT,        -- IDUnitaDiMisura
    QTYGOOD,        -- Qta
    QTYERROR,        -- QtaScartata
    BALANCEDKG,        -- QtaKg
    INVENTTRANSKG,        -- QtaKgTransazioni
    PAINTINGHOOKS        -- NumeroGanci

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOPACKINGITEMS;
GO

