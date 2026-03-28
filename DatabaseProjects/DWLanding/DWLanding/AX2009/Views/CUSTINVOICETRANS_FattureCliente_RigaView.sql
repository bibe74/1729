
CREATE VIEW AX2009.CUSTINVOICETRANS_FattureCliente_RigaView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    INVOICEDATE,        -- DataFattura
    INVOICEID,        -- NumeroFattura
    SALESID,        -- OrdineCliente_Testata
    NUMBERSEQUENCEGROUP,        -- GruppoSequenzeNumeriche
    LINENUM,        -- NumeroRiga
    RECID,        -- PKFattureCliente_Riga

    -- Dimensioni
    INVENTTRANSID,        -- IDGruppoTransazioni
    ITEMID,        -- IDArticoloConfigurato
    NAME,        -- Descrizione
    SALESGROUP,        -- IDGruppoVendite
    LEDGERACCOUNT,        -- IDContoCoGe
    DIMENSION,        -- IDAreaGeografica
    DIMENSION2_,        -- IDProdottoVendita
    DIMENSION3_,        -- IDProdottoAcquisto
    ORIGSALESID,        -- OrdineCliente
    INVENTDIMID,        -- IDDimensioneInventariale
    DIMENSION4_,        -- IDFaseDiGruppo
    DIMENSION5_,        -- IDInfraGruppo
    DIMENSION6_,        -- IDMacroArea

    -- Misure
    SALESUNIT,        -- IDUnitaDiMisura
    QTY,        -- Qta
    INVENTQTY,        -- QtaMagazzino
    NPOQTYSHIPPED,        -- QtaSpedita
    CURRENCYCODE,        -- IDValuta
    LINEAMOUNT,        -- Imponibile
    LINEAMOUNTMST,        -- ImponibileEuro
    SALESPRICE,        -- PrezzoUnitario
    PRICEUNIT,        -- UnitaDiPrezzo
    DISCPERCENT,        -- ScontoPercentuale
    DISCAMOUNT,        -- Sconto
    METSYSSALESPRICE,        -- PrezzoUnitarioSistemi
    METSYSLINEDISC,        -- ScontoSistemi
    METSYSLINEPERCENT,        -- ScontoPercentualeSistemi

    -- Copertura metallo (integrare in Dimensioni)
    METVENDPROJECTID,        -- IDCommessaFornitore
    METMETALCOVERPRICEKG,        -- PrezzoCoperturaMetallo
    METPROJECTCODE,        -- IDCommessa
    SUMLINEDISC,        -- ScontoTotale
    SUMLINEDISCMST        -- ScontoTotaleEuro

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.CUSTINVOICETRANS
WHERE NOT (
    DATAAREAID = N'mspa'
    AND INVOICEID LIKE N'S%'
) -- Esclusione partite aperte Metra Sistemi confluite in Metra
AND NOT (
    DATAAREAID = N'mspa'
    AND INVOICEID LIKE N'MCV%'
) -- Esclusione partite aperte Metra Color confluite in Metra
GO

