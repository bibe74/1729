

CREATE VIEW AX2009.ASSETTABLE_CespiteView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    ASSETID,        -- IDCespite
    RECID,        -- PKCespite

    -- Dimensioni
    ASSETGROUP,        -- GruppoCespiti
    NAME        -- Cespite

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.ASSETTABLE;
GO

