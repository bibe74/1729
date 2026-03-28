
CREATE VIEW AX2009.PURCHLINE_OrdiniFornitore_RigaView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    PURCHID,        -- OrdineFornitore
    LINENUM,        -- NumeroRiga
    RECID,        -- PKOrdiniFornitore_Riga

    -- Dimensioni
    ITEMID,        -- IDArticoloConfigurato
    PURCHSTATUS,        -- IDStatoOrdineFornitore [enum PurchStatus]
    LEDGERACCOUNT,        -- IDContoCoGe
    DELIVERYDATE,        -- DataSpedizioneRichiesta
    DIMENSION,        -- IDAreaGeografica
    DIMENSION2_,        -- IDProdottoVendita
    DIMENSION3_,        -- IDProdottoAcquisto
    CONFIRMEDDLV,        -- DataSpedizioneConfermata
    INVENTTRANSID,        -- IDGruppoTransazioni
    INVENTREFID,        -- NumeroRiferimento
    INVENTREFTRANSID,        -- IDGruppoTransazioniRiferimento
    ITEMREFTYPE,        -- IDTipoRiferimento [enum InventRefType]
    INTERCOMPANYORIGIN,        -- IDOrigineIntercompany [enum IntercompanyOrigin]
    INVENTDIMID,        -- IDDimensioneInventariale
    ASSETID,        -- IDCespite
    INTERCOMPANYINVENTTRANSID,        -- IDGruppoTransazioniIntercompany
    NPOWRKCTRGROUPID,        -- IDMatrice
    NPOPURCHPRICEEXTRA,        -- PrezzoUnitarioGruppiExtra
    NPOLISTPRICE,        -- PrezzoUnitarioListino
    NPOINTERCOMPANYORIGINALIN30008,        -- IDGruppoTransazioniIntercompany
    NPOINTERCOMPANYORIGINALCU30009,        -- IDClienteIntercompany
    NPOINTERCOMPANYORIGINALSALESID,        -- OrdineClienteIntercompany
    DIMENSION4_,        -- IDFaseDiGruppo
    DIMENSION5_,        -- IDInfraGruppo
    DIMENSION6_,        -- IDMacroArea
    NCEMATRIXPURCHTYPE,        -- IDTipologiaAcquistoMatrice [enum NCEMatrixPurchType]
    NPOORIGINALCONFIRMEDDLV,        -- DataConfermatoOriginale

    -- Misure
    PURCHUNIT,        -- IDUnitaDiMisura
    PURCHQTY,        -- Qta
    REMAINPURCHPHYSICAL,        -- QtaRimanenteConsegna
    CURRENCYCODE,        -- IDValuta
    LINEAMOUNT,        -- Importo
    PURCHPRICE,        -- PrezzoUnitario
    PRICEUNIT,        -- UnitaDiPrezzo
    LINEPERCENT,        -- ScontoPercentuale
    LINEDISC        -- Sconto

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.PURCHLINE;
GO

