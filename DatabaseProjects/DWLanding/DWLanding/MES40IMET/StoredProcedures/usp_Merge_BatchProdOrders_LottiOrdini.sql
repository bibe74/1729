
CREATE PROCEDURE MES40IMET.usp_Merge_BatchProdOrders_LottiOrdini
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MES40IMET.BatchProdOrders_LottiOrdini', N'U') IS NULL
BEGIN
    EXEC MES40IMET.usp_Create_BatchProdOrders_LottiOrdini;
    EXEC MES40IMET.usp_AddIndexes_BatchProdOrders_LottiOrdini;
END;

MERGE INTO MES40IMET.BatchProdOrders_LottiOrdini AS TGT
USING MES40IMET.BatchProdOrders_LottiOrdiniView (nolock) AS SRC
ON SRC.BatchProdOrdersID = TGT.BatchProdOrdersID
WHEN MATCHED AND (TGT.BatchID <> SRC.BatchID OR TGT.ProdID <> SRC.ProdID)
  THEN UPDATE SET TGT.BatchID = SRC.BatchID, TGT.ProdID = SRC.ProdID
WHEN NOT MATCHED
  THEN INSERT VALUES (BatchProdOrdersID, BatchID, ProdID)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MES40IMET.BatchProdOrders_LottiOrdini' AS full_olap_table_name,
    'BatchProdOrdersID = ' + CAST(COALESCE(inserted.BatchProdOrdersID, deleted.BatchProdOrdersID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

