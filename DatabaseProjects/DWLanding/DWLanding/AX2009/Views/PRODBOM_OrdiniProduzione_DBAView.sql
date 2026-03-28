
CREATE VIEW AX2009.PRODBOM_OrdiniProduzione_DBAView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    PRODID,        -- OrdineProduzione
    LINENUM,        -- NumeroRiga
    RECID,        -- PKOrdineProduzione_DBA

    -- Dimensioni
    PRODLINETYPE,        -- IDTipoRigaProduzione [enum BOMType]
    ITEMID,        -- IDArticoloConfigurato
    OPRNUM,        -- NumeroOperazione
    INVENTTRANSID,        -- IDGruppoTransazioni
    INVENTREFTYPE,        -- IDRiferimento
    INVENTREFID,        -- NumeroRiferimento
    INVENTREFTRANSID,        -- IDGruppoTransazioniRiferimento
    INVENTDIMID,        -- IDDimensioneInventariale

    -- Misure
    BOMQTY,        -- Qta
    REMAINBOMPHYSICAL,        -- QtaRimanenteConsegna
    QTYBOMSTUP,        -- QtaIniziato
    REMAININVENTPHYSICAL,        -- QtaRimanenteMagazzino
    QTYBOMCALC        -- QtaStimata

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.PRODBOM;
GO

