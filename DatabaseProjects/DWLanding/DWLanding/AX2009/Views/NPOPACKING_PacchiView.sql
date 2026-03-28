
CREATE VIEW AX2009.NPOPACKING_PacchiView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    PACKINGID,        -- NumeroPacco
    RECID,        -- PKPacchi

    -- Dimensioni
    WORKSTATIONID,        -- IDPostazione
    EMPLID,        -- IDOperatore
    INVENTLOCATIONID,        -- IDMagazzino
    WMSLOCATIONID,        -- IDUbicazione
    SHIFTID,        -- IDTurno
    CUSTACCOUNT,        -- IDCliente
    CLOSED,        -- IsChiuso
    DESTROYED,        -- IsEliminato
    PALLETID,        -- IDPallet
    SCRAPPACKAGE,        -- IsScarto
    WORKSTATIONAREAID,        -- IDArea
    WMSLOCATIONIDTO,        -- IDUbicazioneDestinazione
    INTERCOMPANYCUSTACCOUNT,        -- IDClienteIntercompany
    INTERCOMPANYCUSTNAME,        -- ClienteIntercompany
    INVENTSITEID,        -- IDSito
    SCRAPCAUSEID,        -- IDCausaleScarto
    SAVED,        -- IsSalvato
    SCALEWORKSTATIONID,        -- IDPostazioneImballaggio
    SCALEEMPLID,        -- IDOperatoreImballaggio
    SCALEWORKSTATIONAREAID,        -- IDAreaImballaggio
    SCALEDATETIME,        -- DataOraPesatura
    REASON,        -- IDCausale
    LOTID,        -- NumeroLotto
    ISPROD,        -- IsProduzione
    SCRAPPACKAGETYPE,        -- IDTipoPaccoDiScarto [enum NPOScrapPackageType]
    SUSPENDED,        -- IsSospeso
    INTERCOMPANY,        -- IsIntercompany
    INTERCOMPANYCOMPANYID,        -- IDAziendaIntercompany
    CREATEDDATETIME,        -- DataOraCreazione
    REINSTATEMENTMATERIAL,        -- IsReintegroMateriale
    MARKERID,        -- NumeroMarker

    -- Misure
    QTYGOOD,        -- Qta
    QTYERROR,        -- QtaScartata
    QTYTOT,        -- QtaTotale
    GROSSKG,        -- KgLordo
    NETKG,        -- KgNetto
    TAREKG,        -- KgTara
    EXPECTEDNETKG,        -- KgNettoTeorico
    MEASUREDNETKG        -- KgNettoPesatura

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOPACKING;
GO

