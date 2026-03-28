
CREATE VIEW AX2009.WMSSHIPMENT_SpedizioniView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    SHIPMENTID,        -- IDSpedizione
    RECID,        -- PKSpedizione

    -- Dimensioni
    NPOWMSSHIPMENTSTAGING        -- IsSpedizioneDiCarico

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.WMSSHIPMENT;
GO

