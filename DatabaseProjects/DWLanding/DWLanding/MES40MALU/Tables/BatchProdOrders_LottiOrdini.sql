CREATE TABLE [MES40MALU].[BatchProdOrders_LottiOrdini] (
    [BatchProdOrdersID] INT          NOT NULL,
    [BatchID]           CHAR (15)    NOT NULL,
    [ProdID]            VARCHAR (20) NOT NULL
);
GO

ALTER TABLE [MES40MALU].[BatchProdOrders_LottiOrdini]
    ADD CONSTRAINT [PK_BatchProdOrders_LottiOrdini] PRIMARY KEY CLUSTERED ([BatchProdOrdersID] ASC);
GO

