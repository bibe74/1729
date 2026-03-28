
CREATE VIEW AX2009.INVENTTRANS_TransazioniView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    INVENTTRANSID,        -- IDTransazioni
    RECID,        -- PKTransazioni

    -- Dimensioni
    ITEMID,        -- IDArticoloConfigurato
    STATUSISSUE,        -- IDUscita [enum StatusIssue]
    DATEPHYSICAL,        -- DataEffettiva
    TRANSTYPE,        -- IDRiferimento [enum InventTransType]
    TRANSREFID,        -- NumeroRiferimento
    INVOICEID,        -- NumeroFattura
    VOUCHER,        -- Giustificativo
    INVENTTRANSIDTRANSFER,        -- IDTransazioniTrasferimento
    DATEFINANCIAL,        -- DataFinanziaria
    STATUSRECEIPT,        -- IDEntrata [enum StatusReceipt]
    PACKINGSLIPID,        -- NumeroDDT
    VOUCHERPHYSICAL,        -- GiustificativoFisico
    SHIPPINGDATEREQUESTED,        -- DataSpedizioneRichiesta
    SHIPPINGDATECONFIRMED,        -- DataSpedizioneConfermata
    DIRECTION,        -- IDEntrataUscita [enum InventDirection]
    PICKINGROUTEID,        -- IDCicloDiPrelievo
    INVENTDIMID,        -- IDDimensioneInventariale
    DATEINVENT,        -- DataInventario
    CUSTVENDAC,        -- NumeroConto
    TRANSCHILDREFID,        -- NumeroRiferimentoMagazzino
    TRANSCHILDTYPE,        -- IDRiferimentoMagazzino
    INVENTREFTRANSID,        -- IDTransazioniRiferimento
    NPOVALUEBACKGROUND,        -- IDOrigineValore [enum NPOValueBackground]
    NCEREVENUEREFTRANSID,        -- IDGruppoTransazioni

	CAST(CASE WHEN DATEPHYSICAL = CAST('19000101' AS DATETIME) THEN DATEINVENT ELSE DATEPHYSICAL END AS DATE) AS DataTransazione,

    -- Misure
    QTY,        -- Qta
    NPOINVENTQTYPHYSICALONHAND2UM,        -- QtaKg
    NPOPACKINGSLIPWEIGHT,        -- QtaKgDDT
    CURRENCYCODE,        -- IDValuta
    COSTAMOUNTPOSTED,        -- ImportoCostiFinanziario
    COSTAMOUNTADJUSTMENT,        -- ImportoCostiFinanziarioArrotondamento
    COSTAMOUNTPHYSICAL,        -- ImportoCostiFisico
    REVENUEAMOUNTPHYSICAL        -- ImportoRicaviFisico

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTTRANS;
GO

