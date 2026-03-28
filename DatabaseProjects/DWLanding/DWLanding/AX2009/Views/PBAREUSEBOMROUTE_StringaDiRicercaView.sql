
CREATE VIEW AX2009.PBAREUSEBOMROUTE_StringaDiRicercaView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    BOMID,        -- IDVersioneDBA
    ROUTEID,        -- IDCiclo
    RECID,        -- PKStringaDiRicerca

    -- Dimensioni
    INVENTTRANSID,        -- IDGruppoTransazioni
    ITEMID,        -- IDArticoloConfigurato
    SEARCHSTRING        -- StringaDiRicerca

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.PBAREUSEBOMROUTE;
GO

