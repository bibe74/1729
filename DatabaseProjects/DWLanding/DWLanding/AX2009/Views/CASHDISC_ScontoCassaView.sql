
CREATE VIEW AX2009.CASHDISC_ScontoCassaView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    CASHDISCCODE,        -- IDScontoCassa
    RECID,        -- PKScontoCassa

    -- Dimensioni
    DESCRIPTION        -- ScontoCassa

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.CASHDISC;
GO

