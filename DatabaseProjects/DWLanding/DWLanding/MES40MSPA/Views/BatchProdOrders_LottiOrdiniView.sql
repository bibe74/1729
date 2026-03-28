
CREATE VIEW MES40MSPA.BatchProdOrders_LottiOrdiniView
AS
SELECT
    -- Chiavi

    -- Dimensioni
    BatchProdOrdersID,        -- IDLottiOrdini
    BatchID COLLATE DATABASE_DEFAULT AS BatchID,        -- NumeroLotto
    ProdID COLLATE DATABASE_DEFAULT AS ProdID        -- OrdineProduzione

FROM [SQL2014\SCADA2014].MES40_RDP.Press.BatchProdOrders;
GO

