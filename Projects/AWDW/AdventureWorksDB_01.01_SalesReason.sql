USE AdventureWorksDW;
GO

/*
SET NOEXEC OFF;
--*/ SET NOEXEC ON;

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = N'Staging')
BEGIN
    EXEC ('CREATE SCHEMA Staging AUTHORIZATION dbo;'); -- Staging: copies of the original tables with extra fields for ETL
END;
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = N'Updt')
BEGIN
    EXEC ('CREATE SCHEMA Updt AUTHORIZATION dbo;'); -- Updt: copies of the staging tables for bulk updates
END;
GO

/**
 * @table Sales.SalesReason
*/

--DROP TABLE IF EXISTS dbo.DimSalesReason; DROP VIEW IF EXISTS Staging.DimSalesReason; DROP TABLE IF EXISTS Updt.UpdtSalesReason; DROP TABLE IF EXISTS Staging.SalesReason;
GO

IF OBJECT_ID(N'dbo.DimSalesReason', N'U') IS NULL
BEGIN

    CREATE TABLE [Staging].[SalesReason] (
        [SalesReasonID] INT NOT NULL,
        [Name] NVARCHAR(50) NOT NULL,
        [ReasonType] NVARCHAR(50) NOT NULL,
        [ModifiedDate] DATETIME NOT NULL
    );

    CREATE TABLE [Updt].[UpdtSalesReason] (
        [SalesReasonID] INT NOT NULL,
        [SalesReasonName] NVARCHAR(50) NOT NULL,
        [SalesReasonType] NVARCHAR(50) NOT NULL,
        [HistoricalHashKey] VARBINARY(20) NOT NULL,
        [ChangeHashKey] VARBINARY(20) NOT NULL,
        [InsertDttm] DATETIME NOT NULL
    );

    CREATE TABLE [dbo].[DimSalesReason] (
        [SalesReasonKey] INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
        [SalesReasonID] INT NOT NULL,
        [SalesReasonName] NVARCHAR(50) NOT NULL,
        [SalesReasonType] NVARCHAR(50) NOT NULL,
        [HistoricalHashKey] VARBINARY(20) NOT NULL,
        [ChangeHashKey] VARBINARY(20) NOT NULL,
        [InsertDttm] DATETIME NOT NULL,
        [UpdateDttm] DATETIME NULL
    );

END;
GO

CREATE OR ALTER VIEW [Staging].[DimSalesReason]
AS
WITH SalesReasonData
AS (
    SELECT
        [SalesReasonID],
        [Name] AS [SalesReasonName],
        [ReasonType] AS [SalesReasonType],
        CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(SalesReasonID, ' '))) AS [HistoricalHashKey],
        CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(Name, ' ', ReasonType))) AS [ChangeHashKey],
        CURRENT_TIMESTAMP AS InsertDttm,
        CURRENT_TIMESTAMP AS UpdtDttm
    FROM [Staging].[SalesReason]
    UNION
    SELECT
        -1 AS [SalesReasonID],
        'Unknown' AS [SalesReasonName],
        'Unknown' AS [SalesReasonType],
        CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(-1, ' '))) AS [HistoricalHashKey],
        CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT('Unknown', ' ', 'Unknown'))) AS [ChangeHashKey],
        CURRENT_TIMESTAMP AS InsertDttm,
        CURRENT_TIMESTAMP AS UpdtDttm
)
SELECT
    SalesReasonID,
    SalesReasonName,
    SalesReasonType,
    HistoricalHashKey,
    ChangeHashKey,
    CONVERT(VARCHAR(34), HistoricalHashKey, 1) AS HistoricalHashKeyASCII,
    CONVERT(VARCHAR(34), ChangeHashKey, 1) AS ChangeHashKeyASCII,
    InsertDttm,
    UpdtDttm
FROM SalesReasonData;
GO
