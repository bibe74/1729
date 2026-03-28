
CREATE VIEW AX2009.CUSTPACKINGSLIPJOUR_DDTClienteView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    DELIVERYDATE,        -- DataDDT
    PACKINGSLIPID,        -- NumeroDDT
    SALESID,        -- OrdineCliente
    RECID,        -- PKDDTCliente

    -- Dimensioni
    ORDERACCOUNT,        -- IDClienteOrdine
    INVOICEACCOUNT,        -- IDCliente
    DELIVERYNAME,        -- NomeConsegna
    DELIVERYADDRESS,        -- IndirizzoConsegna
    INVOICECOUNTRYREGIONID,        -- IDNazioneFattura
    DLVTERM,        -- IDTerminiConsegna
    DLVMODE,        -- IDModalitaConsegna
    LEDGERVOUCHER,        -- Giustificativo
    DLVZIPCODE,        -- CAPSpedizione
    DLVCOUNTY,        -- IDProvinciaConsegna
    DLVCOUNTRYREGIONID,        -- IDNazioneConsegna
    DLVSTATE,        -- IDRegioneConsegna
    DELIVERYCITY,        -- CittaConsegna
    DELIVERYSTREET,        -- IndirizzoConsegna
    SHIPCARRIERID,        -- IDVettore
    NPOTRANSPORTSTART,        -- DataOraInizioTrasporto
    NPOPACKINGSLIPFROMWMS,        -- IsDDTDaWMSORDERTRANS
    NPOJOURNEYID,        -- IDViaggio
    NPOREFDATAAREAID,        -- IDAziendaTrasporto
    NPOFREECARIERADDRESS,        -- VettoreNonCodificato

    -- Misure
    NPOPALLETNUM,        -- NumeroColli
    QTY,        -- Qta
    WEIGHT        -- QtaKg

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.CUSTPACKINGSLIPJOUR;
GO

