
CREATE VIEW AX2009.CUSTINVOICEJOUR_FattureClienteView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    INVOICEDATE,        -- DataFattura
    INVOICEID,        -- NumeroFattura
    SALESID,        -- OrdineCliente_Testata
    NUMBERSEQUENCEGROUP,        -- GruppoSequenzeNumeriche
    RECID,        -- PKFattureCliente

    -- Dimensioni
    ORDERACCOUNT,        -- IDClienteOrdine
    INVOICEACCOUNT,        -- IDClienteFattura
    LEDGERVOUCHER,        -- Giustificativo
    DIMENSION,        -- IDAreaGeografica
    DIMENSION2_,        -- IDProdottoVendita
    DIMENSION3_,        -- IDProdottoAcquisto
    DLVTERM,        -- IDTerminiConsegna
    DLVCOUNTRYREGIONID,        -- IDNazioneConsegna
    RETURNREASONCODEID,        -- IDMotivoReso
    INVOICETYPE,        -- IDTipoFattura [enum InvoiceType]
    NPOPROJECTCODE,        -- IDCommessa_Testata
    DIMENSION4_,        -- IDFaseDiGruppo
    DIMENSION5_,        -- IDInfraGruppo
    DIMENSION6_,        -- IDMacroArea

    -- Misure
    CURRENCYCODE,        -- IDValuta
    EXCHRATE,        -- TassoDiCambio
    INVOICEAMOUNT,        -- ImportoFattura
    INVOICEAMOUNTMST,        -- ImportoEuroFattura
    SALESBALANCE,        -- ImponibileVenditeFattura
    SALESBALANCEMST,        -- ImponibileEuroVenditeFattura
    SUMMARKUP,        -- ImponibileSpeseFattura
    SUMMARKUPMST,        -- ImponibileEuroSpeseFattura
    SUMTAX,        -- ImportoIVAFattura
    SUMTAXMST        -- ImportoEuroIVAFattura

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.CUSTINVOICEJOUR
WHERE NOT (
    DATAAREAID = N'mspa'
    AND INVOICEID LIKE N'S%'
) -- Esclusione partite aperte Metra Sistemi confluite in Metra
AND NOT (
    DATAAREAID = N'mspa'
    AND INVOICEID LIKE N'MCV%'
) -- Esclusione partite aperte Metra Color confluite in Metra
GO

