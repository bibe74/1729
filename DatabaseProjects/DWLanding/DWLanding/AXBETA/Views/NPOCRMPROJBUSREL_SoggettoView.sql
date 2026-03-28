
CREATE VIEW AXBETA.NPOCRMPROJBUSREL_SoggettoView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    PROJID,        -- IDTarga
    BUSRELTYPE,        -- IDTipoSoggetto [enum NPOCrmBusRelType]
    BUSRELACCOUNT,        -- IDRelazioneCommerciale
    RECID,        -- PKSoggetto

    -- Misure
    CHOSEN        -- IsScelto

FROM [AXBETA\AXBETA].AX2009_METRA_BETA.dbo.NPOCRMPROJBUSREL;
GO

