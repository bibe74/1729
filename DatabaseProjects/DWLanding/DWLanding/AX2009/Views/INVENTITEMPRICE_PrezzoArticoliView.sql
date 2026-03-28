
CREATE VIEW AX2009.INVENTITEMPRICE_PrezzoArticoliView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    ITEMID,        -- IDArticoloConfigurato
    VERSIONID,        -- IDVersione
    RECID,        -- PKPrezzoArticoli

    -- Dimensioni
    PRICETYPE,        -- IDTipoPrezzoCoGe [enum CostingVersionPriceType]
    PRICEUNIT,        -- UnitaDiPrezzo
    PRICECALCID,        -- IDCalcoloDBA
    UNITID,        -- IDUnitaDiMisura
    ACTIVATIONDATE,        -- DataAttivazione
    CREATEDDATETIME,        -- DataOraCreazione

    -- Misure
    PRICE,        -- Prezzo
    PRICEQTY,        -- QtaPrezzo
    MARKUP        -- SpeseVarie

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTITEMPRICE;
GO

