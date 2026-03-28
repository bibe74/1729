
CREATE VIEW AX2009.CUSTCONFIRMJOUR_ConfermaOrdineClienteView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    CONFIRMID,        -- NumeroConfermaOrdineCliente
    RECID,        -- PKConfermaOrdineCliente

    -- Dimensioni
    CONVERT(DATE, CONFIRMDATE) AS CONFIRMDATE,        -- DataConferma
    SALESID        -- OrdineCliente

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.CUSTCONFIRMJOUR
WHERE CONFIRMID <> N'';
GO

