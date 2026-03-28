
CREATE VIEW AX2009.SMMBUSSECTORGROUP_SettoreCommercialeView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    BUSINESSSECTORID,        -- IDSettoreCommerciale
    RECID,        -- PKSettoreCommerciale

    -- Dimensioni
    DESCRIPTION        -- SettoreCommerciale

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.SMMBUSSECTORGROUP;
GO

