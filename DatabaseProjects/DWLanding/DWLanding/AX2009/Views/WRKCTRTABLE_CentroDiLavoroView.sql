
CREATE VIEW AX2009.WRKCTRTABLE_CentroDiLavoroView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    WRKCTRID,        -- IDCentroDiLavoro
    RECID,        -- PKCentroDiLavoro

    -- Dimensioni
    WRKCTRGROUPID,        -- IDGruppoCentroDiLavoro
    NAME,        -- CentroDiLavoro
    WRKCTRTYPE,        -- IDTipoCentroDiLavoro [enum WrkCtrType]
    ISGROUP,        -- IsGruppo
    CALENDARID,        -- IDCalendario
    NPOERRORPCT,        -- PercentualeScarto
    NPOWRKCTRTYPE,        -- IDTipoCentroDiLavoro2 [enum NPOWrkCtrType]
    NPOALLOYDIAMETER,        -- DiametroLega

    -- Misure
    METITEMID        -- IDArticolo

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.WRKCTRTABLE;
GO

