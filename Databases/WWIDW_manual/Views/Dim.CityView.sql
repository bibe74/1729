SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [Dim].[CityView]
AS
SELECT
	T.CityID,
    T.CityName,
    T.StateProvinceCode,
    T.StateProvinceName,
    T.CountryName,
    T.Region,
    T.Subregion,

	T.HistoricalHashKey,
	T.ChangeHashKey,
	CONVERT(VARCHAR(34), T.HistoricalHashKey, 1) AS HistoricalHashKeyASCII,
	CONVERT(VARCHAR(34), T.ChangeHashKey, 1) AS ChangeHashKeyASCII,
	CURRENT_TIMESTAMP AS InsertDttm,
	CURRENT_TIMESTAMP AS UpdateDttm

FROM (
	SELECT
		Ci.CityID,
		Ci.CityName,
		--Ci.StateProvinceID,
		--SP.StateProvinceID,
		SP.StateProvinceCode,
		SP.StateProvinceName,
		--SP.CountryID,
		--Co.CountryID,
		Co.CountryName,
		Co.Region,
		Co.Subregion,
		CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(Ci.CityID, ' '))) AS HistoricalHashKey,
		CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
			Ci.CityName,
			SP.StateProvinceCode,
			SP.StateProvinceName,
			Co.CountryName,
			Co.Region,
			Co.Subregion,
			' '
		))) AS ChangeHashKey

	FROM Staging.Application_Cities Ci
	INNER JOIN Staging.Application_StateProvinces SP ON SP.StateProvinceID = Ci.StateProvinceID
	INNER JOIN Staging.Application_Countries Co ON Co.CountryID = SP.CountryID

	UNION ALL

	SELECT
		-1 AS CityID,
		N'Unknown' AS CityName,
		N'Unknown' AS StateProvinceCode,
		N'Unknown' AS StateProvinceName,
		N'Unknown' AS CountryName,
		N'Unknown' AS Region,
		N'Unknown' AS Subregion,
		CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(-1, ' '))) AS HistoricalHashKey,
		CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT('Unknown', ' ', 'Unknown'))) AS ChangeHashKey
) T;
GO
