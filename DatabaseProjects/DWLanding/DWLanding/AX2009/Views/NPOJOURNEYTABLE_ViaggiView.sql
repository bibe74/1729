
CREATE VIEW AX2009.NPOJOURNEYTABLE_ViaggiView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    JOURNEYID,        -- IDViaggio
    RECID,        -- PKViaggi

    -- Dimensioni
    DELIVERYDATE,        -- DataViaggio
    DLVMODE,        -- IDModalitaConsegna
    DELIVERYNUM,        -- NumeroConsegna
    FUELSURCHARGE,        -- SupplementoCarburante

    -- Misure
    JOURNEYKM,        -- QtaKm
    JOURNEYCOST,        -- ImportoCosto
    REFCHANNEL        -- IDCanale [enum METRecordExportChannel]

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOJOURNEYTABLE;
GO

