
CREATE VIEW AX2009.LEDGERTRANS_TransazioniContabiliView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    TRANSDATE,        -- DataTransazione
    VOUCHER,        -- Giustificativo
    RECID,        -- PKTransazioniContabili

    -- Dimensioni
    ACCOUNTNUM,        -- IDContoCoGe
    TXT,        -- TestoTransazione
    TRANSTYPE,        -- IDTipoTransazione [enum LedgerTransType]
    DIMENSION,        -- IDAreaGeografica
    DIMENSION2_,        -- IDProdottoVendita
    DIMENSION3_,        -- IDProdottoAcquisto
    POSTING,        -- IDTipoRegistrazione [enum LedgerPostingType]
    PERIODCODE,        -- IDCodicePeriodo [enum PeriodCode]
    OPERATIONSTAX,        -- IDLivelloRegistrazione [enum OperationsTax]
    LEDGERPOSTINGJOURNALID,        -- IDGiornaleDiRegistrazione
    TAXREFID,        -- IDRiferimentoCoGeIVA
    CREATEDDATETIME,        -- DataOraCreazione
    NPOVALUEDATE,        -- DataValuta
    NPOCUSTVENDAC,        -- NumeroConto
    DIMENSION4_,        -- IDFaseDiGruppo
    DIMENSION5_,        -- IDInfragruppo
    DIMENSION6_,        -- IDMacroArea

    -- Misure
    CURRENCYCODE,        -- IDValuta
    AMOUNTCUR,        -- Importo
    AMOUNTMST,        -- ImportoEuro
    QTY        -- Qta

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.LEDGERTRANS;
GO

