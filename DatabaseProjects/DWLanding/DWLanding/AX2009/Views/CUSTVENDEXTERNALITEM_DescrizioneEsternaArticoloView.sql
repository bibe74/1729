
CREATE VIEW AX2009.CUSTVENDEXTERNALITEM_DescrizioneEsternaArticoloView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    ITEMID,        -- IDArticoloConfigurato
    INVENTDIMID,        -- IDDimensioneInventariale
    MODULETYPE,        -- IDModulo [enum ModuleInventPurchSalesVendCustGroup]
    CUSTVENDRELATION,        -- IDClienteFornitore
    RECID,        -- PKDescrizioneEsternaArticolo

    -- Dimensioni
    EXTERNALITEMTXT,        -- ArticoloClienteFornitore
    EXTERNALITEMID        -- IDArticoloClienteFornitore

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.CUSTVENDEXTERNALITEM;
GO

