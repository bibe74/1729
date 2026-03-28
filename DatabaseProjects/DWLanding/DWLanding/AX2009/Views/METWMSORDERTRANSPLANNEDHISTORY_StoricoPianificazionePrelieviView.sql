
CREATE VIEW AX2009.METWMSORDERTRANSPLANNEDHISTORY_StoricoPianificazionePrelieviView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    BATCHID,        -- IDPianificazionePrelievi
    RECID,        -- PKStoricoPianificazionePrelievi

    -- Dimensioni
    ORDERTYPE,        -- IDTipoOrdine
    WMSORDERTRANSEXPEDITIONSTATUS,        -- IDStatoMovimentazione [enum METWMSExpeditionStatus]
    ITEMID,        -- IDArticoloConfigurato
    ORDERID,        -- OrdineMagazzino
    INVENTDIMID,        -- IDDimensioneInventariale
    DLVDATE,        -- DataSpedizione
    INVENTTRANSID,        -- IDTransazioni
    INVENTTRANSTYPE,        -- IDRiferimento [enum InventTransType]
    INVENTTRANSREFID,        -- NumeroRiferimento
    SALESID,        -- OrdineCliente
    LINENUM,        -- RigaOrdine
    INVENTLOCATIONIDTO,        -- IDMagazzinoDestinazione
    ITEMFINISHINGID,        -- IDFinitura
    ITEMFINISHINGIDFINAL,        -- IDFinituraOriginaria
    INVENTITEMTYPE,        -- IDTipoArticolo
    PICKAVAILABLE,        -- IsDisponibile

    -- Misure
    REMAINONHANDQTY,        -- QtaDisponibileIniziale
    QTY,        -- Qta
    REMAINSALESPHYSICAL        -- QtaDisponibileFinale

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.METWMSORDERTRANSPLANNEDHISTORY;
GO

