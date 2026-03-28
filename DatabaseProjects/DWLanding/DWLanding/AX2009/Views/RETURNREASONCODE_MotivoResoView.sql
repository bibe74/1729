
CREATE VIEW AX2009.RETURNREASONCODE_MotivoResoView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    REASONCODEID,        -- IDMotivoReso
    RECID,        -- PKMotivoReso

    -- Dimensioni
    REASONCODEGROUPID,        -- IDGruppoMotivoReso
    DESCRIPTION        -- MotivoReso

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.RETURNREASONCODE;
GO

