
CREATE VIEW AX2009.NPOPBAFINISHINGLEADTIME_LeadTimeFinituraView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    FINISHINGID,        -- IDFinitura
    SECTORTYPE,        -- IDTipoSettore [enum NPOSectorTypeId]
    VENDACCOUNT,        -- IDFornitore
    RECID,        -- PKLeadTimeFinitura

    -- Dimensioni
    LEADTIME,        -- LeadTimeFinitura
    STOCKMANAGEDITEM        -- IsGestitoAMagazzino

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOPBAFINISHINGLEADTIME;
GO

