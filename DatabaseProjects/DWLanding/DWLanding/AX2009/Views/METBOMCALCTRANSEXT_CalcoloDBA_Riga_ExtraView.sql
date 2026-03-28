
CREATE VIEW AX2009.METBOMCALCTRANSEXT_CalcoloDBA_Riga_ExtraView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    REFRECID,        -- PKCalcoloDBA_Riga
    RECID,        -- RECID

    -- Misure
    PRIMARYVENDORID,        -- IDFornitorePrimario
    STOPEXPLODEBOMCALCGROUP,        -- IsInterrompiEsplosioneCalcoloPrezzi
    STOPEXPLODEITEM        -- IsInterrompiEsplosioneArticolo

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.METBOMCALCTRANSEXT;
GO

