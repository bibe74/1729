
CREATE VIEW AX2009.AIFENDPOINT_AIFEndPointView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    ENDPOINTID,        -- IDAIFEndPoint
    RECID,        -- PKAIFEndPoint

    -- Dimensioni
    INTERCOMPANYCOMPANYID,        -- IDAziendaIntercompany
    NAME        -- AIFEndPoint

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.AIFENDPOINT;
GO

