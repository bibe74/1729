
CREATE VIEW AX2009.SMMBUSRELSEGMENTGROUP_SegmentoView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    SEGMENTID,        -- IDSegmento
    RECID,        -- PKSegmento

    -- Dimensioni
    DESCRIPTION,        -- Segmento
    BUSINESSSECTORID        -- IDSettoreCommerciale

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.SMMBUSRELSEGMENTGROUP;
GO

