
CREATE PROCEDURE MES40ALMA.usp_Create_BatchProdOrders_LottiOrdini
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MES40ALMA.BatchProdOrders_LottiOrdini (
    -- Chiavi
    BatchProdOrdersID        INT NOT NULL,

    -- Dimensioni
    BatchID        CHAR(15) NOT NULL,
    ProdID        VARCHAR(20) NOT NULL


    -- Constraint
    CONSTRAINT PK_BatchProdOrders_LottiOrdini PRIMARY KEY CLUSTERED (
        BatchProdOrdersID
    )
);

END;
GO

