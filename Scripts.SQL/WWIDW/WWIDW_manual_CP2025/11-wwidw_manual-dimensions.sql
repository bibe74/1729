/*
SET NOEXEC OFF;
--*/ SET NOEXEC ON;

/*
 * file: 11-wwidw_manual-dimensions.sql
*/

USE WWIDW_manual;
GO

IF SCHEMA_ID('Dim') IS NULL EXEC('CREATE SCHEMA Dim AUTHORIZATION dbo;');
GO

/**
 * @table Dim.City
 * @description Dimension City

 * @reads_from
    WideWorldImporters.Application.Cities
    WideWorldImporters.Application.StateProvinces
    WideWorldImporters.Application.Countries
*/

IF OBJECT_ID('dbo.seq_Dim_City', 'SO') IS NULL
BEGIN

    CREATE SEQUENCE dbo.seq_Dim_City START WITH 1;

END;
GO

CREATE OR ALTER VIEW Dim.CityView
AS
WITH TableData
AS (
    SELECT
        ACi.CityID,
        ACi.CityName,
        ASP.StateProvinceCode,
        ASP.StateProvinceName,
        ACo.CountryName,
        ACo.IsoAlpha3Code,
        ACo.Continent,
        ACo.Region,
        ACo.Subregion,
        ASP.SalesTerritory

    FROM WideWorldImporters.Application.Cities ACi
    INNER JOIN WideWorldImporters.Application.StateProvinces ASP ON ASP.StateProvinceID = ACi.StateProvinceID
    INNER JOIN WideWorldImporters.Application.Countries ACo ON ACo.CountryID = ASP.CountryID
)
SELECT
    -- Chiavi
    TD.CityID,

    CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
        TD.CityID,
    	' '
    ))) AS HistoricalHashKey,
    CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
        TD.CityName,
        TD.StateProvinceCode,
        TD.StateProvinceName,
        TD.CountryName,
        TD.IsoAlpha3Code,
        TD.Continent,
        TD.Region,
        TD.Subregion,
        TD.SalesTerritory,
    	' '
    ))) AS ChangeHashKey,
    CURRENT_TIMESTAMP AS InsertDatetime,
    CURRENT_TIMESTAMP AS UpdateDatetime,
    CAST(0 AS BIT) AS IsDeleted,
    
    -- Dimensioni
    TD.CityName,
    TD.StateProvinceCode,
    TD.StateProvinceName,
    TD.CountryName,
    TD.IsoAlpha3Code,
    TD.Continent,
    TD.Region,
    TD.Subregion,
    TD.SalesTerritory
    	
    -- Misure
    	
FROM TableData TD;
GO

--DROP TABLE IF EXISTS Dim.City;
GO

IF OBJECT_ID('Dim.City', 'U') IS NULL
BEGIN

    SELECT TOP (0) 0 AS CityKey, * INTO Dim.City FROM Dim.CityView;

	ALTER TABLE Dim.City ALTER COLUMN CityKey INT NOT NULL;
	ALTER TABLE Dim.City ADD CONSTRAINT DFT_Dim_City_CityKey DEFAULT (NEXT VALUE FOR dbo.seq_Dim_City) FOR CityKey;
    ALTER TABLE Dim.City ADD CONSTRAINT PK_Dim_City PRIMARY KEY CLUSTERED (CityKey);

    CREATE UNIQUE NONCLUSTERED INDEX IX_Dim_City_CityID ON Dim.City (CityID);

    INSERT INTO Dim.City (
        CityKey,
        CityID,
        HistoricalHashKey,
        ChangeHashKey,
        InsertDatetime,
        UpdateDatetime,
        IsDeleted,
        CityName,
        StateProvinceCode,
        StateProvinceName,
        CountryName,
        IsoAlpha3Code,
        Continent,
        Region,
        Subregion,
        SalesTerritory
    )
    SELECT
        -1,
        -1,
        CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
            -1,
    	    ' '
        ))),
        CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
            N'',
    	    ' '
        ))),
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        CAST(0 AS BIT),
        N'',
        N'',
        N'',
        N'',
        N'',
        N'',
        N'',
        N'',
        N''

    UNION ALL

    SELECT
        -101,
        -101,
        CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
            -101,
    	    ' '
        ))),
        CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
            N'<???>',
    	    ' '
        ))),
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        CAST(0 AS BIT),
        N'<???>',
        N'<???>',
        N'<???>',
        N'<???>',
        N'???',
        N'<???>',
        N'<???>',
        N'<???>',
        N'<???>';

    ALTER SEQUENCE dbo.seq_Dim_City RESTART WITH 1;

END;
GO

CREATE OR ALTER PROCEDURE Dim.usp_Merge_City
AS
BEGIN

    SET NOCOUNT ON;

    WITH TGT AS (
        SELECT * FROM Dim.City WHERE CityKey > 0
    )
    MERGE INTO TGT
    USING Dim.CityView AS SRC
    ON SRC.CityID = TGT.CityID

    WHEN MATCHED AND (SRC.ChangeHashKey <> TGT.ChangeHashKey)
      THEN UPDATE SET
        TGT.ChangeHashKey = SRC.ChangeHashKey,
        TGT.UpdateDatetime = SRC.UpdateDatetime,
        TGT.IsDeleted = SRC.IsDeleted,
        TGT.CityName = SRC.CityName,
        TGT.StateProvinceCode = SRC.StateProvinceCode,
        TGT.StateProvinceName = SRC.StateProvinceName,
        TGT.CountryName = SRC.CountryName,
        TGT.IsoAlpha3Code = SRC.IsoAlpha3Code,
        TGT.Continent = SRC.Continent,
        TGT.Region = SRC.Region,
        TGT.Subregion = SRC.Subregion,
        TGT.SalesTerritory = SRC.SalesTerritory

    WHEN NOT MATCHED AND SRC.IsDeleted = CAST(0 AS BIT)
      THEN INSERT (
        CityID,
        HistoricalHashKey,
        ChangeHashKey,
        InsertDatetime,
        UpdateDatetime,
        IsDeleted,
        CityName,
        StateProvinceCode,
        StateProvinceName,
        CountryName,
        IsoAlpha3Code,
        Continent,
        Region,
        Subregion,
        SalesTerritory
	  ) VALUES (
        SRC.CityID,
        SRC.HistoricalHashKey,
        SRC.ChangeHashKey,
        SRC.InsertDatetime,
        SRC.UpdateDatetime,
        SRC.IsDeleted,
        SRC.CityName,
        SRC.StateProvinceCode,
        SRC.StateProvinceName,
        SRC.CountryName,
        SRC.IsoAlpha3Code,
        SRC.Continent,
        SRC.Region,
        SRC.Subregion,
        SRC.SalesTerritory
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
        'Dim.City' AS full_olap_table_name,
        'CityID = ' + CAST(COALESCE(inserted.CityID, deleted.CityID) AS NVARCHAR) AS primary_key_description;

END;
GO

EXEC Dim.usp_Merge_City;
GO

/**
 * @table Dim.Customer
 * @description Dimension Customer

 * @reads_from
    WideWorldImporters.Sales.Customers

 * @depends_on
    Dim.City
*/

IF OBJECT_ID('dbo.seq_Dim_Customer', 'SO') IS NULL
BEGIN

    CREATE SEQUENCE dbo.seq_Dim_Customer START WITH 1;

END;
GO

CREATE OR ALTER VIEW Dim.CustomerView
AS
WITH TableData
AS (
    SELECT
        SC.CustomerID,
        SC.CustomerName,
        SCC.CustomerCategoryName,
        COALESCE(C.CityKey, CASE WHEN SC.DeliveryCityID = 0 THEN -1 ELSE -101 END) AS DeliveryCityKey,
        SC.DeliveryAddressLine1,
        SC.DeliveryAddressLine2,
        SC.DeliveryPostalCode

    FROM WideWorldImporters.Sales.Customers SC
    INNER JOIN WideWorldImporters.Sales.CustomerCategories SCC ON SCC.CustomerCategoryID = SC.CustomerCategoryID
    LEFT JOIN Dim.City C ON C.CityID = SC.DeliveryCityID
        AND C.IsDeleted = CAST(0 AS BIT)
)
SELECT
    -- Chiavi
    TD.CustomerID,

    CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
        TD.CustomerID,
    	' '
    ))) AS HistoricalHashKey,
    CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
        TD.CustomerName,
        TD.CustomerCategoryName,
        TD.DeliveryCityKey,
        TD.DeliveryAddressLine1,
        TD.DeliveryAddressLine2,
        TD.DeliveryPostalCode,
    	' '
    ))) AS ChangeHashKey,
    CURRENT_TIMESTAMP AS InsertDatetime,
    CURRENT_TIMESTAMP AS UpdateDatetime,
    CAST(0 AS BIT) AS IsDeleted,
    
    -- Dimensioni
    TD.CustomerName,
    TD.CustomerCategoryName,
    TD.DeliveryCityKey,
    TD.DeliveryAddressLine1,
    TD.DeliveryAddressLine2,
    TD.DeliveryPostalCode
    	
    -- Misure
    	
FROM TableData TD;
GO

--DROP TABLE IF EXISTS Dim.Customer;
GO

IF OBJECT_ID('Dim.Customer', 'U') IS NULL
BEGIN

    SELECT TOP (0) 0 AS CustomerKey, * INTO Dim.Customer FROM Dim.CustomerView;

	ALTER TABLE Dim.Customer ALTER COLUMN CustomerKey INT NOT NULL;
	ALTER TABLE Dim.Customer ADD CONSTRAINT DFT_Dim_Customer_CustomerKey DEFAULT (NEXT VALUE FOR dbo.seq_Dim_Customer) FOR CustomerKey;
    ALTER TABLE Dim.Customer ADD CONSTRAINT PK_Dim_Customer PRIMARY KEY CLUSTERED (CustomerKey);

    CREATE UNIQUE NONCLUSTERED INDEX IX_Dim_Customer_CustomerID ON Dim.Customer (CustomerID);

    ALTER TABLE Dim.Customer ALTER COLUMN DeliveryCityKey INT NOT NULL;
    ALTER TABLE Dim.Customer ADD CONSTRAINT FK_Dim_Customer_DeliveryCityKey FOREIGN KEY (DeliveryCityKey) REFERENCES Dim.City (CityKey);

    INSERT INTO Dim.Customer (
        CustomerKey,
        CustomerID,
        HistoricalHashKey,
        ChangeHashKey,
        InsertDatetime,
        UpdateDatetime,
        IsDeleted,
        CustomerName,
        CustomerCategoryName,
        DeliveryCityKey,
        DeliveryAddressLine1,
        DeliveryAddressLine2,
        DeliveryPostalCode
    )
    SELECT
        -1,
        -1,
        CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
            -1,
    	    ' '
        ))),
        CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
            N'',
    	    ' '
        ))),
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        CAST(0 AS BIT),
        N'',
        N'',
        -1,
        N'',
        N'',
        N''

    UNION ALL

    SELECT
        -101,
        -101,
        CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
            -101,
    	    ' '
        ))),
        CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
            N'<???>',
    	    ' '
        ))),
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        CAST(0 AS BIT),
        N'<???>',
        N'<???>',
        -101,
        N'<???>',
        N'<???>',
        N'<???>';

    ALTER SEQUENCE dbo.seq_Dim_Customer RESTART WITH 1;

END;
GO

CREATE OR ALTER PROCEDURE Dim.usp_Merge_Customer
AS
BEGIN

    SET NOCOUNT ON;

    WITH TGT AS (
        SELECT * FROM Dim.Customer WHERE CustomerKey > 0
    )
    MERGE INTO TGT
    USING Dim.CustomerView AS SRC
    ON SRC.CustomerID = TGT.CustomerID

    WHEN MATCHED AND (SRC.ChangeHashKey <> TGT.ChangeHashKey)
      THEN UPDATE SET
        TGT.ChangeHashKey = SRC.ChangeHashKey,
        TGT.UpdateDatetime = SRC.UpdateDatetime,
        TGT.IsDeleted = SRC.IsDeleted,
        TGT.CustomerName = SRC.CustomerName,
        TGT.CustomerCategoryName = SRC.CustomerCategoryName,
        TGT.DeliveryCityKey = SRC.DeliveryCityKey,
        TGT.DeliveryAddressLine1 = SRC.DeliveryAddressLine1,
        TGT.DeliveryAddressLine2 = SRC.DeliveryAddressLine2,
        TGT.DeliveryPostalCode = SRC.DeliveryPostalCode

    WHEN NOT MATCHED AND SRC.IsDeleted = CAST(0 AS BIT)
      THEN INSERT (
        CustomerID,
        HistoricalHashKey,
        ChangeHashKey,
        InsertDatetime,
        UpdateDatetime,
        IsDeleted,
        CustomerName,
        CustomerCategoryName,
        DeliveryCityKey,
        DeliveryAddressLine1,
        DeliveryAddressLine2,
        DeliveryPostalCode
	  ) VALUES (
        SRC.CustomerID,
        SRC.HistoricalHashKey,
        SRC.ChangeHashKey,
        SRC.InsertDatetime,
        SRC.UpdateDatetime,
        SRC.IsDeleted,
        SRC.CustomerName,
        SRC.CustomerCategoryName,
        SRC.DeliveryCityKey,
        SRC.DeliveryAddressLine1,
        SRC.DeliveryAddressLine2,
        SRC.DeliveryPostalCode
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
        'Dim.Customer' AS full_olap_table_name,
        'CustomerID = ' + CAST(COALESCE(inserted.CustomerID, deleted.CustomerID) AS NVARCHAR) AS primary_key_description;

END;
GO

EXEC Dim.usp_Merge_Customer;
GO
