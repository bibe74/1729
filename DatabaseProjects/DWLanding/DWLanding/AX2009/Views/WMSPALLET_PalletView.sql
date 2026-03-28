
CREATE VIEW AX2009.WMSPALLET_PalletView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    WMSPALLETID,        -- IDPallet
    RECID,        -- PKPallet

    -- Dimensioni
    WMSLOCATIONID,        -- IDUbicazione
    INVENTLOCATIONID,        -- IDMagazzino
    NPOBUILDDATE,        -- DataCreazione
    NPODESTROYED,        -- IsDistrutto
    NPOLASTINVENTLOCATIONIDWEIGHT,        -- IDMagazzinoPesatura
    NPOLASTWORKSTATIONIDWEIGHT,        -- IDPostazionePesatura
    NPOLASTWORKSTATIONAREAIDWEIGHT,        -- IDAreaPesatura

    -- Misure
    NPOPALLETNETWEIGHT,        -- KgNetti
    NPOPALLETGROSSWEIGHT,        -- KgLordi
    NPOPALLETTAREWEIGHT        -- KgTara

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.WMSPALLET;
GO

