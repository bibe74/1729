
CREATE VIEW MES40IMET.BatchProdOrders_LottiOrdiniView
AS
SELECT
    -- Chiavi

    -- Dimensioni
    BatchProdOrdersID,        -- IDLottiOrdini
    BatchID COLLATE DATABASE_DEFAULT AS BatchID,        -- NumeroLotto
    ProdID COLLATE DATABASE_DEFAULT AS ProdID        -- OrdineProduzione

FROM [SQL2012IMET\SCADA2012].MES40_RDP.Press.BatchProdOrders;
GO

