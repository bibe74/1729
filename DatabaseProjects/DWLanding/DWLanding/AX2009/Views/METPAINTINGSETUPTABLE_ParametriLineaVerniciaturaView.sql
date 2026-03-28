
CREATE VIEW AX2009.METPAINTINGSETUPTABLE_ParametriLineaVerniciaturaView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    PAINTINGLINEID,        -- IDLineaVerniciatura
    RECID,        -- PKParametriLineaVerniciatura

    -- Misure
    PROCESSTIMECALCTYPE,        -- IDTipoCalcolo
    CHAINSPEED,        -- VelocitaCatena
    HOOKSPERMETER        -- NumeroGanciPerMetro

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.METPAINTINGSETUPTABLE;
GO

