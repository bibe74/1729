
CREATE VIEW AX2009.VENDINVOICETRANS_FattureFornitore_RigaView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    PURCHID,        -- OrdineFornitore_Testata
    INVOICEID,        -- NumeroFattura
    INVOICEDATE,        -- DataFattura
    NUMBERSEQUENCEGROUP,        -- GruppoSequenzaNumerica
    INTERNALINVOICEID,        -- NumeroFatturaInterna
    LINENUM,        -- NumeroRiga
    RECID,        -- PKFattureFornitore_Riga

    -- Dimensioni
    INVENTTRANSID,        -- IDTransazioni
    ITEMID,        -- IDArticoloConfigurato
    DIMENSION,        -- IDAreaGeografica
    DIMENSION2_,        -- IDProdottoVendita
    DIMENSION3_,        -- IDProdottoAcquisto
    ORIGPURCHID,        -- OrdineFornitore
    INVENTDIMID,        -- IDDimensioneInventariale
    DIMENSION4_,        -- IDFaseDiGruppo
    DIMENSION5_,        -- IDInfragruppo
    DIMENSION6_,        -- IDCentroDiCosto

    -- Misure
    PURCHUNIT,        -- IDUnitaDiMisura
    QTY,        -- Qta
    INVENTQTY,        -- QtaMagazzino
    CURRENCYCODE,        -- IDValuta
    LINEAMOUNT,        -- Imponibile
    LINEAMOUNTMST,        -- ImponibileEuro
    PURCHPRICE,        -- PrezzoUnitario
    PRICEUNIT,        -- UnitaDiPrezzo
    DISCPERCENT,        -- ScontoPercentuale
    DISCAMOUNT        -- Sconto

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.VENDINVOICETRANS;
GO

