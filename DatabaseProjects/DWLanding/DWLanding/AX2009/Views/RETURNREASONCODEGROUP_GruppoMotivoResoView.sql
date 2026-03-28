
CREATE VIEW AX2009.RETURNREASONCODEGROUP_GruppoMotivoResoView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    REASONCODEGROUPID,        -- IDGruppoMotivoReso
    RECID,        -- PKGruppoMotivoReso

    -- Dimensioni
    DESCRIPTION        -- GruppoMotivoReso

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.RETURNREASONCODEGROUP;
GO

