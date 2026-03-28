
CREATE VIEW AX2009.SALESLINE_OrdiniCliente_RigaView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    SALESID,        -- OrdineCliente
    NPOLINENUM,        -- RigaOrdine
    RECID,        -- PKOrdiniCliente_Riga

    -- Dimensioni
    ITEMID,        -- IDArticoloConfigurato
    SALESSTATUS,        -- IDStatoOrdine [enum SalesStatus]
    NAME,        -- Descrizione
    EXTERNALITEMID,        -- CodiceArticoloEsterno
    DIMENSION,        -- IDAreaGeografica
    DIMENSION2_,        -- IDProdottoVendita
    DIMENSION3_,        -- IDProdottoAcquisto
    INVENTTRANSID,        -- IDGruppoTransazioni
    UNDERDELIVERYPCT,        -- UnderDeliveryTolerance
    OVERDELIVERYPCT,        -- OverDeliveryTolerance
    INVENTREFTRANSID,        -- IDGruppoTransazioniRiferimento
    INVENTREFTYPE,        -- IDTipoRiferimento [enum InventRefType]
    INVENTREFID,        -- NumeroRiferimento
    INTERCOMPANYORIGIN,        -- IDOrigineIntercompany [enum IntercompanyOrigin]
    INVENTDIMID,        -- IDDimensioneInventariale
    CUSTOMERLINENUM,        -- RigaOrdineCliente
    SHIPPINGDATEREQUESTED,        -- DataSpedizioneRichiesta
    SHIPPINGDATECONFIRMED,        -- DataSpedizioneConfermata
    CREATEDDATETIME,        -- DataOraCreazione
    NPODLVREASON,        -- IDCausaleConsegna
    NPOFINISHINGID,        -- IDFinitura
    NPOOTHERINFO,        -- IDAltreSpecifiche [enum NPOPBANOYesId]
    NPOPHYSICALSTATEALLOYID,        -- IDStatoFisico
    NPOLENGTH,        -- LunghezzaBarra
    NPOALLOYID,        -- IDLega
    NPOPBAINTERCOMPANYBOMITEMID,        -- IDArticolConfiguratoDBAIntercompany
    NPOCONTRACTWORKTRANSID,        -- IDGruppoTransazioniContoLavorazione
    NPOREVENUEREFTRANSID,        -- IDGruppoTransazioniRigaArticolo
    NPOREVENUESALESLINE,        -- IDTipologiaRiga [enum NPORevenueSalesLineType]
    NPOWRKCTRGROUPID,        -- CodiceMatrice
    NPOWRKCTRCHARGES,        -- IsContributoSpeseMatrici
    NPOINTERCOMPANYORIGINALSALESID,        -- OrdineClienteOriginario
    NPOINTERCOMPANYORIGINALCU30041,        -- IDClienteOriginario
    NPOINTERCOMPANYORIGINALIN30042,        -- IDGruppoTransazioniOriginario
    DIMENSION4_,        -- IDFaseDiGruppo
    DIMENSION5_,        -- IDInfraGruppo
    DIMENSION6_,        -- IDMacroArea
    NCEPROFILEFINISHWEIGHTCHECKED,        -- IsArticoloGestitoConFinitura
    NCEREQUISITIONTYPE,        -- IDTipoApprovvigionamento [enum NCERequisitionType]
    NPOWRKCTRREFPURCHID,        -- OrdineFornitoreRiferimento

    -- Misure
    SALESUNIT,        -- IDUnitaDiMisura_old
    SALESQTY,        -- Qta_old
    NPOSALESUNIT,        -- IDUnitaDiMisura
    NPOSALESQTY,        -- Qta
    QTYORDERED,        -- QtaOrdinata
    REMAINSALESPHYSICAL,        -- QtaRimanenteConsegna
    REMAININVENTPHYSICAL,        -- QtaRimanenteConsegnaMagazzino
    REMAINSALESFINANCIAL,        -- QtaRimanenteFattura
    CURRENCYCODE,        -- IDValuta
    LINEAMOUNT,        -- Imponibile
    SALESPRICE,        -- PrezzoUnitario
    PRICEUNIT,        -- UnitaDiPrezzo
    LINEPERCENT,        -- ScontoPercentuale
    LINEDISC        -- Sconto

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.SALESLINE;
GO

