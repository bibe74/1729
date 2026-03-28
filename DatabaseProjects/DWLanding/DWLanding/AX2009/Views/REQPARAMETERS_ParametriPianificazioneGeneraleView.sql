
CREATE VIEW AX2009.REQPARAMETERS_ParametriPianificazioneGeneraleView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    RECID,        -- PKParametriPianificazioneGenerale

    -- Dimensioni
    TODAYSDATECALENDARID        -- IDCalendario

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.REQPARAMETERS;
GO

