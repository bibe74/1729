
CREATE VIEW AX2009.NPOWRKCTRCAPTABLE_CapacitaCentroDiLavoroView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    WRKCTRID,        -- IDCentroDiLavoro
    YR,        -- Anno
    WEEK,        -- Settimana
    ITEMID,        -- IDArticoloConfigurato
    CUSTACCOUNT,        -- IDCliente
    RECID,        -- PKCapacitaCentroDiLavoro

    -- Dimensioni
    PRODID,        -- OrdineProduzione

    -- Misure
    KG        -- QtaKg

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOWRKCTRCAPTABLE;
GO

