
CREATE VIEW AX2009.NPOSCRAP_DichiarazioniScartoView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    LOTID,        -- NumeroLotto
    PACKINGID,        -- NumeroPacco
    RECID,        -- PKDichiarazioniScarto

    -- Dimensioni
    WMSLOCATIONID,        -- IDUbicazione
    INVENTLOCATIONID,        -- IDMagazzino
    SCRAPCAUSEID,        -- IDCausaleScarto
    ITEMID,        -- IDArticoloConfigurato
    BASKETNO,        -- IDCesta
    WORKSTATIONID,        -- IDPostazione
    SCRAPTYPE,        -- IDTipoScarto [enum NPOScrapType]
    INVENTREFID,        -- NumeroRiferimento
    INVENTREFTYPE,        -- IDTipoRiferimento [enum InventRefType]
    CREATEDDATETIME,        -- DataOraCreazione
    ITEMLENGTH,        -- LunghezzaBarra

    -- Misure
    QTY        -- Qta

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOSCRAP;
GO

