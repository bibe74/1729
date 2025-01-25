SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [Fact].[SalesOrdersView]
AS
SELECT
    T.OrderLineID,
    T.OrderID,
    T.CustomerKey,
    T.OrderDate,
    T.SalesAmount,

	T.HistoricalHashKey,
	T.ChangeHashKey,
	CONVERT(VARCHAR(34), T.HistoricalHashKey, 1) AS HistoricalHashKeyASCII,
	CONVERT(VARCHAR(34), T.ChangeHashKey, 1) AS ChangeHashKeyASCII,
	CURRENT_TIMESTAMP AS InsertDttm,
	CURRENT_TIMESTAMP AS UpdateDttm

FROM (
	SELECT
		O.OrderID,
        --O.CustomerID,
		C.CustomerKey,
        O.OrderDate,
        OL.OrderLineID,
        --OL.OrderID,
        --OL.Quantity,
        --OL.UnitPrice,
		OL.Quantity * OL.UnitPrice AS SalesAmount,
		CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(OL.OrderLineID, ' '))) AS HistoricalHashKey,
		CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
			O.OrderID,
			C.CustomerKey,
			O.OrderDate,
			OL.Quantity,
			OL.UnitPrice,
			' '
		))) AS ChangeHashKey

	FROM Staging.Sales_Orders O
	INNER JOIN Staging.Sales_OrderLines OL ON OL.OrderID = O.OrderID
	INNER JOIN Dim.Customer C ON C.CustomerID = O.CustomerID
) T;
GO
