/*
SET NOEXEC OFF;
--*/ SET NOEXEC ON;

/*
 * file: 21-wwidw_manual-facts.sql
*/

USE WWIDW_manual;
GO

IF SCHEMA_ID('Fact') IS NULL EXEC('CREATE SCHEMA Fact AUTHORIZATION dbo;');
GO

/**
 * @table Fact.OrderLines
 * @description Dimension OrderLines

 * @reads_from
    WideWorldImporters.Sales.OrderLines
    WideWorldImporters.Sales.Order

 * @depends_on
    Dim.Customer
*/

IF OBJECT_ID('dbo.seq_Dim_OrderLines', 'SO') IS NULL
BEGIN

    CREATE SEQUENCE dbo.seq_Dim_OrderLines START WITH 1;

END;
GO

CREATE OR ALTER VIEW Fact.OrderLinesView
AS
WITH TableData
AS (
    SELECT
        SOL.OrderLineID,
        SO.OrderID,
        --SO.CustomerID,
        COALESCE(C.CustomerKey, CASE WHEN C.CustomerID = 0 THEN -1 ELSE -101 END) AS CustomerKey,
        SO.OrderDate,
        SOL.Quantity,
        --SOL.UnitPrice,
        SOL.Quantity * SOL.UnitPrice AS TotalPrice
    
    FROM WideWorldImporters.Sales.OrderLines SOL
    INNER JOIN WideWorldImporters.Sales.Orders SO ON SO.OrderID = SOL.OrderID
    LEFT JOIN Dim.Customer C ON C.CustomerID = SO.CustomerID
        AND C.IsDeleted = CAST(0 AS BIT)
)
SELECT
    -- Chiavi
    TD.OrderLineID,

    CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
        TD.OrderLineID,
    	' '
    ))) AS HistoricalHashKey,
    CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
        TD.OrderID,
        TD.CustomerKey,
        TD.OrderDate,
        TD.Quantity,
        TD.TotalPrice,
    	' '
    ))) AS ChangeHashKey,
    CURRENT_TIMESTAMP AS InsertDatetime,
    CURRENT_TIMESTAMP AS UpdateDatetime,
    CAST(0 AS BIT) AS IsDeleted,
    
    -- Dimensioni
    TD.OrderID,
    TD.CustomerKey,
    TD.OrderDate,
    	
    -- Misure
    TD.Quantity,
    TD.TotalPrice
    	
FROM TableData TD;
GO

--DROP TABLE IF EXISTS Fact.OrderLines;
GO

IF OBJECT_ID('Fact.OrderLines', 'U') IS NULL
BEGIN

    SELECT TOP (0) 0 AS OrderLinesKey, * INTO Fact.OrderLines FROM Fact.OrderLinesView;

	ALTER TABLE Fact.OrderLines ALTER COLUMN OrderLinesKey INT NOT NULL;
	ALTER TABLE Fact.OrderLines ADD CONSTRAINT DFT_Dim_OrderLines_OrderLinesKey DEFAULT (NEXT VALUE FOR dbo.seq_Dim_OrderLines) FOR OrderLinesKey;
    ALTER TABLE Fact.OrderLines ADD CONSTRAINT PK_Dim_OrderLines PRIMARY KEY CLUSTERED (OrderLinesKey);

    CREATE UNIQUE NONCLUSTERED INDEX IX_Dim_OrderLines_OrderLinesID ON Fact.OrderLines (OrderLineID);

    ALTER TABLE Fact.OrderLines ALTER COLUMN CustomerKey INT NOT NULL;
    ALTER TABLE Fact.OrderLines ADD CONSTRAINT FK_Dim_OrderLines_CustomerKey FOREIGN KEY (CustomerKey) REFERENCES Dim.Customer (CustomerKey);

    ALTER SEQUENCE dbo.seq_Dim_OrderLines RESTART WITH 1;

END;
GO

CREATE OR ALTER PROCEDURE Fact.usp_Merge_OrderLines
AS
BEGIN

    SET NOCOUNT ON;

    MERGE INTO Fact.OrderLines AS TGT
    USING Fact.OrderLinesView AS SRC
    ON SRC.OrderLineID = TGT.OrderLineID

    WHEN MATCHED AND (SRC.ChangeHashKey <> TGT.ChangeHashKey)
      THEN UPDATE SET
        TGT.ChangeHashKey = SRC.ChangeHashKey,
        TGT.UpdateDatetime = SRC.UpdateDatetime,
        TGT.IsDeleted = SRC.IsDeleted,
        TGT.OrderID = SRC.OrderID,
        TGT.CustomerKey = SRC.CustomerKey,
        TGT.OrderDate = SRC.OrderDate,
        TGT.Quantity = SRC.Quantity,
        TGT.TotalPrice = SRC.TotalPrice

    WHEN NOT MATCHED AND SRC.IsDeleted = CAST(0 AS BIT)
      THEN INSERT (
        OrderLineID,
        HistoricalHashKey,
        ChangeHashKey,
        InsertDatetime,
        UpdateDatetime,
        IsDeleted,
        OrderID,
        CustomerKey,
        OrderDate,
        Quantity,
        TotalPrice
	  ) VALUES (
        SRC.OrderLineID,
        SRC.HistoricalHashKey,
        SRC.ChangeHashKey,
        SRC.InsertDatetime,
        SRC.UpdateDatetime,
        SRC.IsDeleted,
        SRC.OrderID,
        SRC.CustomerKey,
        SRC.OrderDate,
        SRC.Quantity,
        SRC.TotalPrice
      )

    WHEN NOT MATCHED BY SOURCE
        AND TGT.IsDeleted = CAST(0 AS BIT)
      THEN UPDATE
        SET TGT.ChangeHashKey = CONVERT(VARBINARY(20), ''),
            TGT.UpdateDatetime = CURRENT_TIMESTAMP,
	        TGT.IsDeleted = CAST(1 AS BIT)

    OUTPUT
        CURRENT_TIMESTAMP AS merge_datetime,
        ----$action AS merge_action,
        CASE WHEN Inserted.IsDeleted = CAST(1 AS BIT) THEN N'DELETE' ELSE $action END AS merge_action,
        'Fact.OrderLines' AS full_olap_table_name,
        'OrderLineID = ' + CAST(COALESCE(inserted.OrderLineID, deleted.OrderLineID) AS NVARCHAR) AS primary_key_description;

END;
GO

EXEC Fact.usp_Merge_OrderLines;
GO
