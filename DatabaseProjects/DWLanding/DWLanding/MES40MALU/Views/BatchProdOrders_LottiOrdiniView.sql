
CREATE VIEW MES40MALU.BatchProdOrders_LottiOrdiniView
AS
SELECT
    -- Chiavi

    -- Dimensioni
    BatchProdOrdersID,        -- IDLottiOrdini
    BatchID COLLATE DATABASE_DEFAULT AS BatchID,        -- NumeroLotto
    ProdID COLLATE DATABASE_DEFAULT AS ProdID        -- OrdineProduzione

FROM [192.168.216.247\SCADA2017].MES40_RDP.Press.BatchProdOrders;
GO

