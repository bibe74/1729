
CREATE VIEW AX2009.NPOBOXPALLETRELATION_RelazioneCestaPalletView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    NPOBOXID,        -- IDCesta
    NPOPACKINGID,        -- IDPallet
    PRODID,        -- OrdineProduzione
    OPRNUM,        -- NumeroOperazione
    INBOX,        -- IsInCesta
    RECID,        -- PKRelazioneCestaPallet

    -- Dimensioni
    OPRID,        -- Operazione

    -- Misure
    QTY,        -- Qta
    NPOSECONDUNITQTY        -- QtaKg

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOBOXPALLETRELATION;
GO

