
CREATE VIEW AX2009.ASSETGROUP_GruppoCespitiView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    GROUPID,        -- IDGruppoCespiti

    -- Dimensioni
    NAME        -- GruppoCespiti

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.ASSETGROUP;
GO

