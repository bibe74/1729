CREATE VIEW AX2009.SALESTABLE_OrdiniClienteView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    SALESID,        -- OrdineCliente
    RECID,        -- PKOrdiniCliente

    -- Dimensioni
    CUSTACCOUNT,        -- IDCliente
    INVOICEACCOUNT,        -- IDClienteFattura
    PURCHORDERFORMNUM,        -- RichiestaApprovvigionamentoCliente
    SALESGROUP,        -- IDGruppoVendite
    DOCUMENTSTATUS,        -- IDStatoDocumento [enum DocumentStatus]
    INTERCOMPANYORIGINALSALESID,        -- OrdineClienteOriginario
    PAYMENT,        -- IDTerminiPagamento
    CASHDISC,        -- IDScontoCassa
    INTERCOMPANYORIGINALCUSTACCO22,        -- IDClienteOriginario
    CUSTOMERREF,        -- RiferimentoCliente
    DLVTERM,        -- IDTerminiConsegna
    DLVMODE,        -- IDModalitaConsegna
    SALESSTATUS,        -- IDStatoOrdine [enum SalesStatus]
    SALESTYPE,        -- IDTipoOrdine [enum SalesType]
    SALESPOOLID,        -- IDPoolVendite
    INTERCOMPANYDIRECTDELIVERY,        -- IsConsegnaDiretta
    INTERCOMPANYDIRECTDELIVERYORIG,        -- IsConsegnaDirettaOriginaria
    DELIVERYZIPCODE,        -- CAPConsegna
    DELIVERYCOUNTY,        -- IDProvinciaConsegna
    DELIVERYCOUNTRYREGIONID,        -- IDNazioneConsegna
    DELIVERYSTATE,        -- IDRegioneConsegna
    INTERCOMPANYORIGIN,        -- IDOrigineIntercompany [enum IntercompanyOrigin]
    RETURNITEMNUM,        -- CodiceNAR
    INVENTLOCATIONID,        -- IDMagazzino
    PAYMMODE,        -- IDMetodoPagamentoCliente
    DELIVERYCITY,        -- CittaConsegna
    INTERCOMPANYCOMPANYID,        -- IDAziendaOriginaria
    INTERCOMPANYPURCHID,        -- OrdineFornitoreOriginario
    INTERCOMPANYORDER,        -- IsOrdineIntercompany
    DLVREASON,        -- IDCausaleConsegna_Testata
    RECEIPTDATEREQUESTED,        -- DataRicevimentoRichiesta
    RECEIPTDATECONFIRMED,        -- DataRicevimentoConfermata
    SHIPPINGDATEREQUESTED,        -- DataSpedizioneRichiesta
    SHIPPINGDATECONFIRMED,        -- DataSpedizioneConfermata
    INVENTSITEID,        -- IDSito
    NPOCONFIRMBLOCKED,        -- IsConfermaBloccataPerFido
    NPODATEDLVCUSTREQUEST,        -- DataConsegnaRichiesta
    NPOCREDITBLOCKED,        -- IsBloccatoPerFido
    CREATEDDATETIME,        -- DataOraCreazione
    CREATEDBY,        -- UtenteCreazione
    NPOWEEKRECEIPTDATECONFIRMED,        -- SettimanaRicevimentoConfermata
    NPOWEEKSHIPPINGDATECONFIRMED,        -- SettimanaSpedizioneConfermata
    NPOPROJECTCODE,        -- IDCommessa
    NPOPURCHIDAS400,        -- OrdineFornitoreAS400
    NPOSALESIDAS400,        -- OrdineClienteAS400
    NPORECEIVEDFROMAS400,        -- IsRicevutoDaAS400
    NPOPROJECTCUSTACCOUNT,        -- IDClienteCommessa
    NPOSALESWEBNUM,        -- OrdineClienteWeb
    NPODLVDATEFORCING,        -- IsForzaturaCommerciale
    NPODLVDATEFORCINGSTATUS,        -- StatoForzaturaCommerciale [enum NPODlvDateForcingStatus]
    NPORETURNDISPOSITIONCODEID,        -- IDCodiceSmaltimento
    NCEREINSTATEMENTMATERIAL,        -- IsReintegroMateriale
    METACQUISITIONDATE,        -- DataAcquisizione
    METSDICUP,        -- CodiceCUP
    METSDICIG,        -- CodiceCIG
    METDELIVERYDATEVERIFICATION,        -- VerificaDataConsegna [enum METDeliveryDateVerification]

    -- Misure
    CURRENCYCODE        -- IDValuta

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.SALESTABLE;
GO

