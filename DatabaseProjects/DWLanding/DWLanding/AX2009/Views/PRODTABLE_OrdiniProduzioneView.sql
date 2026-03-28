
CREATE VIEW AX2009.PRODTABLE_OrdiniProduzioneView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    PRODID,        -- OrdineProduzione
    RECID,        -- PKOrdiniProduzione

    -- Dimensioni
    ITEMID,        -- IDArticoloConfigurato
    PRODSTATUS,        -- IDStatoOrdineProduzione [enum ProdStatus]
    SCHEDSTATUS,        -- IDStatoProgrammazione [enum ProdSchedStatus]
    DLVDATE,        -- DataConsegna
    STUPDATE,        -- DataInizio
    FINISHEDDATE,        -- DataProduzione
    SCHEDSTART,        -- DataInizioProgrammazione
    SCHEDEND,        -- DataConsegnaPianificata,DataFineProgrammazione
    INVENTTRANSID,        -- IDGruppoTransazioni
    INVENTREFTYPE,        -- IDTipoRiferimento [enum InventRefType]
    INVENTREFID,        -- NumeroRiferimento
    INVENTREFTRANSID,        -- IDGruppoTransazioniRiferimento
    COLLECTREFLEVEL,        -- LivelloOrdineProduzione
    COLLECTREFPRODID,        -- OrdineProduzioneRiferimento
    BACKORDERSTATUS,        -- IDStatoRimanenze [enum ProdBackStatus]
    REQPLANIDSCHED,        -- PianoGeneraleOrdinePianificato
    LATESTSCHEDDATE,        -- DataUltimaProgrammazione
    INVENTDIMID,        -- IDDimensioneInventariale
    SCHEDTOTIME,        -- OraFineProgrammazione
    SCHEDFROMTIME,        -- OraInizioProgrammazione
    CREATEDDATETIME,        -- DataOraCreazione
    NPOSEQUENCENUMBER,        -- NumeroSequenza
    NPOBOMPALLETID,        -- IDPalletBOM
    NPOSTUPTIME,        -- OraInizio
    NPOFINISHINGID,        -- IDFinitura
    NPOLENGTH,        -- LunghezzaDescrizione
    METLOCKPACKING,        -- IsBloccoImballaggio

    -- Misure
    QTYSCHED,        -- Qta
    NPOPRODQTYMORE,        -- QtaAggiuntiva
    REMAININVENTPHYSICAL        -- QtaRimanente

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.PRODTABLE;
GO

