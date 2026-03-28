
CREATE VIEW AX2009.NPOWORKSTATION_PostazioneDiLavoroView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    WORKSTATIONID,        -- IDPostazioneDiLavoro
    RECID,        -- PKPostazioneDiLavoro

    -- Dimensioni
    WMSLOCATIONID,        -- IDUbicazione
    EMPLID,        -- IDDipendente
    INVENTLOCATIONID,        -- IDMagazzino
    WRKCTRID,        -- IDCentroDiLavoro
    GROUPWRKCTRID,        -- IDGruppoCentroDiLavoro
    AREAID,        -- IDAreaDiLavoro
    INVENTSITEID,        -- IDSito
    WORKSTATIONNAME        -- PostazioneDiLavoro

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOWORKSTATION;
GO

