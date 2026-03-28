
CREATE VIEW AX2009.PRICEDISCTABLE_AccordiPrezziView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    RELATION,        -- IDTipoPrezzo [enum PriceType]
    ITEMCODE,        -- IDCodiceArticolo [enum TableGroupAll]
    ACCOUNTCODE,        -- IDCodiceConto [enum TableGroupAll]
    ITEMRELATION,        -- IDArticoloConfigurato
    ACCOUNTRELATION,        -- IDCliente
    QUANTITYAMOUNT,        -- Qta
    FROMDATE,        -- DataInizioValidita
    TODATE,        -- DataFineValidita
    RECID,        -- PKAccordiPrezzi

    -- Dimensioni
    UNITID,        -- IDUnitaDiMisura
    INVENTDIMID,        -- IDDimensioneInventariale

    -- Misure
    PERCENT1,        -- PercentualeSconto1
    PERCENT2,        -- PercentualeSconto2
    CURRENCY,        -- IDValuta
    AMOUNT,        -- Prezzo
    PRICEUNIT,        -- UnitaDiPrezzo
    MARKUP        -- ImportoSpese

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.PRICEDISCTABLE;
GO

