
CREATE VIEW AX2009.METPRICECALCITEMSETUP_CalcoloPrezzi_ExtraView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    REFTABLEID,        -- REFTABLEID
    REFRECID,        -- REFRECID
    RECID,        -- PKCalcoloPrezzi_Extra

    -- Dimensioni
    PRIMARYVENDORID,        -- IDFornitore
    STOPEXPLODEITEM,        -- IsInterrompiEsplosioneArticolo
    BOMCALCGROUPID,        -- IDGruppoCalcoloDBA
    STOPEXPLODEBOMCALCGROUP        -- IsInterrompiEsplosioneDBA

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.METPRICECALCITEMSETUP;
GO

