
CREATE VIEW AX2009.WMSORDERTRANS_OrdiniMagazzino_RigaView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    ORDERID,        -- OrdineMagazzino
    RECID,        -- PKOrdiniMagazzino_Riga

    -- Dimensioni
    ROUTEID,        -- IDCicliDiPrelievo
    EXPEDITIONSTATUS,        -- IDStatoSpedizione [enum WMSExpeditionStatus]
    ITEMID,        -- IDArticoloConfigurato
    OPERATOR,        -- IDOperatore
    EXPEDITIONTIME,        -- OraSpedizione
    ISRESERVED,        -- IsRiservato
    SHIPMENTIDORIGINAL,        -- IDSpedizioniOriginale
    SHIPMENTID,        -- IDSpedizioni
    INVENTDIMID,        -- IDDimensioneInventariale
    DLVDATE,        -- DataConsegna
    ORDERTYPE,        -- IDTipoMovimentazione [enum WMSOrderType]
    INVENTTRANSID,        -- IDGruppoTransazioni
    FULLPALLET,        -- IsFullPallet
    TOINVENTDIMID,        -- IDDimensioneInventarialeDestinazione
    PALLETIDPICKED,        -- IDPallet
    INVENTTRANSTYPE,        -- IDRiferimento [enum InventTransType]
    INVENTTRANSREFID,        -- NumeroRiferimento
    NPOKASTOID,        -- NumeroPosizioneKasto
    NPOPACKINGSLIPID,        -- NumeroDDT
    NPOPACKINGSLIPTRANSRECID,        -- PKDocumentiDiTrasporto_Riga
    CREATEDDATETIME,        -- DataOraCreazione
    NPOPICKEDDATETIME,        -- DataOraPreparazione

    -- Misure
    QTY,        -- Qta
    NPOPACKINGSLIPWEIGHT        -- QtaKg

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.WMSORDERTRANS;
GO

