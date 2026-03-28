
CREATE VIEW AX2009.SMMBUSRELSALESDISTRICTGROUP_ZonaDiVenditaView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    SALESDISTRICTID,        -- IDZonaDiVendita
    RECID,        -- PKZonaDiVendita

    -- Dimensioni
    DESCRIPTION        -- ZonaDiVendita

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.SMMBUSRELSALESDISTRICTGROUP;
GO

