
CREATE VIEW AX2009.DIRPARTYTABLE_RubricaView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    PARTYID,        -- IDRubrica
    RECID,        -- PKRubrica

    -- Dimensioni
    [NAME],        -- Nome
    NPODIRPARTYTABLEGROUPID        -- IDGruppoRubrica

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.DIRPARTYTABLE;
GO

