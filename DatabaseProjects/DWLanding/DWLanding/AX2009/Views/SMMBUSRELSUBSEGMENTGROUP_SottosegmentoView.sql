
CREATE VIEW AX2009.SMMBUSRELSUBSEGMENTGROUP_SottosegmentoView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    SEGMENTID,        -- IDSegmento
    SUBSEGMENTID,        -- IDSottosegmento
    RECID,        -- PKSottosegmento

    -- Dimensioni
    SUBSEGMENTDESCRIPTION        -- Sottosegmento

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.SMMBUSRELSUBSEGMENTGROUP;
GO

