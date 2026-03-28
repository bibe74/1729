
CREATE VIEW AX2009.METPAINTINGPOWDERWMSLOCATION_FinituraUbicazioneView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    PAINTFINISHINGID,        -- IDFinitura
    WMSLOCATIONID,        -- IDUbicazione
    RECID        -- PKFinituraUbicazione

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.METPAINTINGPOWDERWMSLOCATION;
GO

