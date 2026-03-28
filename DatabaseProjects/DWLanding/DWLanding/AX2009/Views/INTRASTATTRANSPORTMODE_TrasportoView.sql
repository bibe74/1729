
CREATE VIEW AX2009.INTRASTATTRANSPORTMODE_TrasportoView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    TRANSPORTCODE,        -- IDTrasporto
    RECID,        -- PKTrasporto

    -- Dimensioni
    DESCRIPTION        -- Trasporto

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INTRASTATTRANSPORTMODE;
GO

