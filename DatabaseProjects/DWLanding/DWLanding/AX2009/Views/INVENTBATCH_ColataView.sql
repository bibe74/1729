
CREATE VIEW AX2009.INVENTBATCH_ColataView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    ITEMID,        -- Lega
    INVENTBATCHID,        -- IDColata
    RECID,        -- PKColata

    -- Dimensioni
    PRODDATE,        -- DataProduzione
    METLOGLENGTH,        -- Lunghezza
    METINVENTSIZEID,        -- Diametro
    METINVENTCOLORID        -- Colore

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTBATCH;
GO

