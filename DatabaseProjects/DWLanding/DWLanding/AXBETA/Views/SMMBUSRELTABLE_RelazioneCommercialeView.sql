
CREATE VIEW AXBETA.SMMBUSRELTABLE_RelazioneCommercialeView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    BUSRELACCOUNT,        -- IDRelazioneCommerciale
    RECID,        -- PKRelazioneCommerciale

    -- Dimensioni
    NAME        -- RelazioneCommerciale

FROM [AXBETA\AXBETA].AX2009_METRA_BETA.dbo.SMMBUSRELTABLE;
GO

