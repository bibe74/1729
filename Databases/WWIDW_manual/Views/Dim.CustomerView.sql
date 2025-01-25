SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [Dim].[CustomerView]
AS
SELECT
	T.CustomerID,
    T.CustomerName,
    T.DeliveryCityKey,

	T.HistoricalHashKey,
	T.ChangeHashKey,
	CONVERT(VARCHAR(34), T.HistoricalHashKey, 1) AS HistoricalHashKeyASCII,
	CONVERT(VARCHAR(34), T.ChangeHashKey, 1) AS ChangeHashKeyASCII,
	CURRENT_TIMESTAMP AS InsertDttm,
	CURRENT_TIMESTAMP AS UpdateDttm

FROM (
	SELECT
		C.CustomerID,
		C.CustomerName,
		--C.DeliveryCityID,
		DC.CityKey AS DeliveryCityKey,
		CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(C.CustomerID, ' '))) AS HistoricalHashKey,
		CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
			C.CustomerName,
			DC.CityKey,
			' '
		))) AS ChangeHashKey

	FROM Staging.Sales_Customers C
	INNER JOIN Dim.City DC ON DC.CityID = C.DeliveryCityID

	UNION ALL

	SELECT
		U.UnknownKey AS CustomerID,
		U.UnknownName AS CustomerName,
		C.CityKey AS DeliveryCityKey,
		CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(U.UnknownKey, ' '))) AS HistoricalHashKey,
		CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(U.UnknownName, ' '))) AS ChangeHashKey
	FROM (
		SELECT
			-1 AS UnknownKey,
			N'Unknown' AS UnknownName
	) U
	INNER JOIN Dim.City C ON C.CityID = U.UnknownKey
) T;
GO
