
CREATE VIEW AX2009.PRODROUTE_CicloLavorazioneProduzioneView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    PRODID,        -- OrdineProduzione
    OPRNUM,        -- NumeroOperazione
    RECID,        -- PKCicloLavorazioneProduzione

    -- Dimensioni
    OPRID,        -- IDOperazione
    WRKCTRID,        -- IDCentroDiLavoro
    PROCESSTIME,        -- TempoDiEsecuzione
    PROCESSPERQTY,        -- QtaLavorazione
    TOHOURS        -- OrePerOra

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.PRODROUTE;
GO

