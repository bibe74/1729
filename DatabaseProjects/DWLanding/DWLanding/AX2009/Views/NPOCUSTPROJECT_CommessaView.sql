CREATE VIEW AX2009.NPOCUSTPROJECT_CommessaView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    CUSTACCOUNT,        -- IDCliente
    PROJECTCODE,        -- IDCommessa
    RECID,        -- PKCommessa

    -- Dimensioni
    DOCUMENTDESCRIPTION,        -- Commessa
    VENDPROJECTID,        -- IDCommessaFornitore

    -- Misure
    TOTALQTY,        -- QtaKg
    METCOVERAGETYPE        -- IDTipoCopertura [enum METCoverageType]

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOCUSTPROJECT;
GO

