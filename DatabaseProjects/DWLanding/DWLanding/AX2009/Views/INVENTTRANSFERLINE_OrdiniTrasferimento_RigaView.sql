
CREATE VIEW AX2009.INVENTTRANSFERLINE_OrdiniTrasferimento_RigaView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    TRANSFERID,        -- OrdineTrasferimento
    LINENUM,        -- NumeroRiga
    RECID,        -- PKOrdiniTrasferimento_Riga

    -- Dimensioni
    ITEMID,        -- IDArticoloConfigurato
    INVENTTRANSID,        -- IDGruppoTransazioni
    INVENTTRANSIDRECEIVE,        -- IDTransazioneRicevimento
    SHIPDATE,        -- DataSpedizione
    RECEIVEDATE,        -- DataRicevimento
    NPOINVENTTRANSIDPRODBOM,        -- IDGruppoTransazioniProdBOM

    -- Misure
    UNITID,        -- IDUnitaDiMisura
    QTYTRANSFER,        -- QtaTrasferita
    QTYREMAINSHIP,        -- QtaRimanenteSpedizione
    QTYSHIPPED        -- QtaSpedita

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTTRANSFERLINE;
GO

