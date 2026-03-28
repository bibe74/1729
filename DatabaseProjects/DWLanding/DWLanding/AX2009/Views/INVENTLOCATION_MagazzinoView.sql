
CREATE VIEW AX2009.INVENTLOCATION_MagazzinoView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    INVENTSITEID,        -- IDSito
    INVENTLOCATIONID,        -- IDMagazzino
    RECID,        -- PKMagazzino

    -- Dimensioni
    REQCALENDARID,        -- REQCALENDARID
    VENDACCOUNT        -- IDFornitore

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTLOCATION;
GO

