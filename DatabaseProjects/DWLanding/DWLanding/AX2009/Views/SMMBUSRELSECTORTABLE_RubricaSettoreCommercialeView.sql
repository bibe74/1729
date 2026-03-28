
CREATE VIEW AX2009.SMMBUSRELSECTORTABLE_RubricaSettoreCommercialeView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    PARTYID,        -- IDRubrica
    BUSINESSSECTORID,        -- IDSettoreCommerciale
    RECID        -- PKRubricaSettoreCommerciale

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.SMMBUSRELSECTORTABLE;
GO

