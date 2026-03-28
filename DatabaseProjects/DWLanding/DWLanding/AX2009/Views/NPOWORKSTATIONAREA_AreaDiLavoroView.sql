
CREATE VIEW AX2009.NPOWORKSTATIONAREA_AreaDiLavoroView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    AREAID,        -- IDAreaDiLavoro
    RECID,        -- PKAreaDiLavoro

    -- Dimensioni
    DEPARTMENTID        -- IDReparto

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOWORKSTATIONAREA;
GO

