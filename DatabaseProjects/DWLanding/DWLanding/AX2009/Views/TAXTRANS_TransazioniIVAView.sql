
CREATE VIEW AX2009.TAXTRANS_TransazioniIVAView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    TRANSDATE,        -- DataTransazione
    VOUCHER,        -- Giustificativo
    RECID,        -- PKTransazioniIVA

    -- Dimensioni
    SOURCE,        -- IDOrigine [enum TaxModuleType]
    TAXCODE,        -- IDCodiceIVA
    ACCOUNTNUM,        -- IDContoCoGe
    TAXDIRECTION,        -- IDTipoIVA [enum TaxDirection]
    DIMENSION,        -- IDAreaGeografica
    DIMENSION2_,        -- IDProdottoVendita
    DIMENSION3_,        -- IDProdottoAcquisto
    TAXGROUP,        -- IDFasciaIVA
    TAXBOOKID,        -- IDLibroIVA
    TAXBOOKSECTIONID,        -- IDSezionaleIVA
    DIMENSION4_,        -- IDFaseDiGruppo
    DIMENSION5_,        -- IDInfragruppo
    DIMENSION6_,        -- IDMacroArea
    CURRENCYCODE,        -- IDValuta

    -- Misure
    SOURCECURRENCYCODE,        -- IDValutaGiustificativo
    SOURCEBASEAMOUNTCUR,        -- Imponibile
    SOURCETAXAMOUNTCUR,        -- ImportoIVA
    SOURCEREGULATEAMOUNTCUR,        -- ImportoIVA*
    TAXBASEAMOUNTCUR,        -- Imponibile
    TAXAMOUNTCUR,        -- ImportoIVA
    TAXINCOSTPRICECUR,        -- ImportoIVAIndetraibile
    TAXINCOSTPRICEMST        -- ImportoEuroIVAIndetraibile

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.TAXTRANS;
GO

