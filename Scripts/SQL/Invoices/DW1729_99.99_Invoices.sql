CREATE SCHEMA Dim AUTHORIZATION dbo;
GO

CREATE SCHEMA Fact AUTHORIZATION dbo;
GO

--DROP TABLE IF EXISTS Dim.Customer; DROP TABLE IF EXISTS Dim.Date;
GO

CREATE OR ALTER VIEW Dim.DateView
AS
WITH TimeSpan
AS (
    SELECT
        MIN(Anno) AS Year_MIN,
        MAX(Anno) AS Year_MAX

    FROM dbo.[Fatture$]
)
SELECT
    DateKey,
    Date,
    FullDateUK,
    FullDateUSA,
    DayOfMonth,
    DaySuffix,
    DayName,
    DayOfWeekUSA,
    DayOfWeekUK,
    DayOfWeekInMonth,
    DayOfWeekInYear,
    DayOfQuarter,
    DayOfYear,
    WeekOfMonth,
    WeekOfQuarter,
    WeekOfYear,
    Month,
    MonthName,
    MonthOfQuarter,
    Quarter,
    QuarterName,
    Year,
    YearName,
    MonthYear,
    MMYYYY,
    FirstDayOfMonth,
    LastDayOfMonth,
    FirstDayOfQuarter,
    LastDayOfQuarter,
    FirstDayOfYear,
    LastDayOfYear,
    IsHolidayUSA,
    IsWeekday,
    HolidayUSA,
    IsHolidayUK,
    HolidayUK,
    DayNameIT,
    MonthNameIT,
    IsHolidayIT,
    HolidayIT,
    FullDateIT

FROM tools.dbo.DimDate D
INNER JOIN TimeSpan TS ON D.Year BETWEEN TS.Year_MIN AND TS.Year_MAX;
GO

IF OBJECT_ID('Dim.Date', 'U') IS NULL
BEGIN

    SELECT TOP (0)
        DateKey,
        Date,
        FullDateUK,
        FullDateUSA,
        DayOfMonth,
        DaySuffix,
        DayName,
        DayOfWeekUSA,
        DayOfWeekUK,
        DayOfWeekInMonth,
        DayOfWeekInYear,
        DayOfQuarter,
        DayOfYear,
        WeekOfMonth,
        WeekOfQuarter,
        WeekOfYear,
        Month,
        MonthName,
        MonthOfQuarter,
        Quarter,
        QuarterName,
        Year,
        YearName,
        MonthYear,
        MMYYYY,
        FirstDayOfMonth,
        LastDayOfMonth,
        FirstDayOfQuarter,
        LastDayOfQuarter,
        FirstDayOfYear,
        LastDayOfYear,
        IsHolidayUSA,
        IsWeekday,
        HolidayUSA,
        IsHolidayUK,
        HolidayUK,
        DayNameIT,
        MonthNameIT,
        IsHolidayIT,
        HolidayIT,
        FullDateIT
    
    INTO Dim.Date
    FROM Dim.DateView
    ORDER BY DateKey;

    ALTER TABLE Dim.Date ADD CONSTRAINT PK_Dim_Date PRIMARY KEY CLUSTERED (DateKey);

END;
GO

INSERT INTO Dim.Date
SELECT
    V.*

FROM Dim.DateView V
LEFT JOIN Dim.Date T ON T.DateKey = V.DateKey
WHERE T.DateKey IS NULL
ORDER BY V.DateKey;
GO

--DROP TABLE IF EXISTS Dim.Customer;
GO

CREATE OR ALTER VIEW Dim.CustomerView
AS
SELECT
    F.Cliente AS CustomerName,
    MIN(DF.DateKey) AS FirstInvoiceDateKey

FROM dbo.[Fatture$] F
INNER JOIN Dim.Date DF ON DF.Date = F.[Data fattura]
GROUP BY F.Cliente;
GO

IF OBJECT_ID('Dim.Customer', 'U') IS NULL
BEGIN

    SELECT TOP (0)
        IDENTITY(INT, 1, 1) AS CustomerKey,
        CustomerName,
        FirstInvoiceDateKey

    INTO Dim.Customer
    FROM Dim.CustomerView;

    ALTER TABLE Dim.Customer ADD CONSTRAINT PK_Dim_Customer PRIMARY KEY CLUSTERED (CustomerKey);

    ALTER TABLE Dim.Customer ADD CONSTRAINT FK_Dim_Customer_FirstInvoiceDateKey FOREIGN KEY (FirstInvoiceDateKey) REFERENCES Dim.Date (DateKey);

    CREATE UNIQUE NONCLUSTERED INDEX IX_Dim_Customer_CustomerName ON Dim.Customer (CustomerName);

END;
GO

INSERT INTO Dim.Customer
(
    CustomerName,
    FirstInvoiceDateKey
)
SELECT
    V.CustomerName,
    V.FirstInvoiceDateKey

FROM Dim.CustomerView V
LEFT JOIN Dim.Customer T ON T.CustomerName = V.CustomerName
WHERE T.CustomerName IS NULL
ORDER BY V.FirstInvoiceDateKey;
GO

--DROP TABLE IF EXISTS Dim.Category;
GO

CREATE OR ALTER VIEW Dim.CategoryView
AS
SELECT DISTINCT
    F.Categoria AS CategoryName,
    CAST(CASE F.Categoria
    WHEN N'Rimborso spese' THEN 1
    WHEN N'Vendita autoveicoli' THEN 1
    WHEN N'Vendita hardware' THEN 1
    ELSE 0
    END AS BIT) AS IsExtraConsulting

FROM dbo.[Fatture$] F;
GO

IF OBJECT_ID('Dim.Category', 'U') IS NULL
BEGIN

    SELECT TOP (0)
        IDENTITY(INT, 1, 1) AS CategoryKey,
        CategoryName,
        IsExtraConsulting

    INTO Dim.Category
    FROM Dim.CategoryView;

    ALTER TABLE Dim.Category ADD CONSTRAINT PK_Dim_Category PRIMARY KEY CLUSTERED (CategoryKey);

    CREATE UNIQUE NONCLUSTERED INDEX IX_Dim_Category_CategoryName ON Dim.Category (CategoryName);

END;
GO

INSERT INTO Dim.Category
(
    CategoryName,
    IsExtraConsulting
)
SELECT
    V.CategoryName,
    V.IsExtraConsulting

FROM Dim.CategoryView V
LEFT JOIN Dim.Category T ON T.CategoryName = V.CategoryName
WHERE T.CategoryName IS NULL
ORDER BY V.CategoryName;
GO

--DROP TABLE IF EXISTS Dim.VATCode;
GO

CREATE OR ALTER VIEW Dim.VATCodeView
AS
SELECT DISTINCT
    CONVERT(VARCHAR(2), CAST(F.[% IVA] * 100.0 AS INT)) AS VatCode,
    CONVERT(DECIMAL(5, 2), F.[% IVA] * 100.0) AS VATPercent

FROM dbo.[Fatture$] F
WHERE F.[% IVA] IS NOT NULL;
GO

IF OBJECT_ID('Dim.VATCode', 'U') IS NULL
BEGIN

    SELECT TOP (0)
        IDENTITY(INT, 1, 1) AS VATCodeKey,
        VATCode,
        VATPercent

    INTO Dim.VATCode
    FROM Dim.VATCodeView;

    ALTER TABLE Dim.VATCode ADD CONSTRAINT PK_Dim_VATCode PRIMARY KEY CLUSTERED (VATCodeKey);

    CREATE UNIQUE NONCLUSTERED INDEX IX_Dim_VATCode_VATCode ON Dim.VATCode (VATCode);

    SET IDENTITY_INSERT Dim.VATCode ON;

    INSERT INTO Dim.VATCode (VATCodeKey, VatCode, VATPercent) VALUES (-1, '', 0.0);

    SET IDENTITY_INSERT Dim.VATCode OFF;

END;
GO

INSERT INTO Dim.VATCode
(
    VATCode,
    VATPercent
)
SELECT
    V.VATCode,
    V.VATPercent

FROM Dim.VATCodeView V
LEFT JOIN Dim.VATCode T ON T.VATCode = V.VATCode
WHERE T.VATCode IS NULL
ORDER BY V.VATCode;
GO

--DROP TABLE IF EXISTS Fact.Invoices;
GO

CREATE OR ALTER VIEW Fact.InvoicesView
AS
SELECT
    DF.DateKey AS InvoiceDateKey,
    DF.Year AS InvoiceYear,
    CAST(F.Progressivo AS INT) AS InvoiceNumber,
    F.[Numero fattura] AS InvoiceID,
    C.CustomerKey,
    Cat.CategoryKey,
    COALESCE(VC.VATCodeKey, -1) AS VatCodeKey,

    F.[Imponibile prestazioni] AS LineAmount,
    F.[Rivalsa parziale INPS] AS PartialCompensationAmount,
    F.[Totale imponibile] AS InvoiceAmount,
    F.[Importo IVA] AS VATAmount,
    F.[Totale fattura] AS TotalAmount,
    F.[Ritenuta acconto] AS WithHoldingTaxAmount,
    F.[Netto da versare] AS NetToPayAmount,
    F.Pagato AS PaidAmount,
    F.IsSaldata AS IsSettled

FROM dbo.[Fatture$] F
INNER JOIN Dim.Date DF ON DF.Date = F.[Data fattura]
INNER JOIN Dim.Customer C ON C.CustomerName = F.Cliente
INNER JOIN Dim.Category Cat ON Cat.CategoryName = F.Categoria
LEFT JOIN Dim.VATCode VC ON VC.VATPercent = 100.0 * F.[% IVA];
GO

IF OBJECT_ID('Fact.Invoices', 'U') IS NULL
BEGIN

    SELECT TOP (0)
        IDENTITY(INT, 1, 1) AS InvoiceKey,
        InvoiceDateKey,
        InvoiceYear,
        InvoiceNumber,
        InvoiceID,
        CustomerKey,
        CategoryKey,
        VatCodeKey,
        LineAmount,
        PartialCompensationAmount,
        InvoiceAmount,
        VATAmount,
        TotalAmount,
        WithHoldingTaxAmount,
        NetToPayAmount,
        PaidAmount,
        IsSettled

    INTO Fact.Invoices
    FROM Fact.InvoicesView;

    ALTER TABLE Fact.Invoices ALTER COLUMN VatCodeKey INT NOT NULL;

    ALTER TABLE Fact.Invoices ADD CONSTRAINT PK_Fact_Invoices PRIMARY KEY CLUSTERED (InvoiceKey);

    CREATE UNIQUE NONCLUSTERED INDEX IX_Fact_Invoices_InvoiceYear_InvoiceNumber ON Fact.Invoices (InvoiceYear, InvoiceNumber);
    CREATE UNIQUE NONCLUSTERED INDEX IX_Fact_Invoices_InvoiceID ON Fact.Invoices (InvoiceID);

    ALTER TABLE Fact.Invoices ADD CONSTRAINT FK_Fact_Invoices_InvoiceDateKey FOREIGN KEY (InvoiceDateKey) REFERENCES Dim.Date (DateKey);
    ALTER TABLE Fact.Invoices ADD CONSTRAINT FK_Fact_Invoices_CustomerKey FOREIGN KEY (CustomerKey) REFERENCES Dim.Customer (CustomerKey);
    ALTER TABLE Fact.Invoices ADD CONSTRAINT FK_Fact_Invoices_CategoryKey FOREIGN KEY (CategoryKey) REFERENCES Dim.Category (CategoryKey);
    ALTER TABLE Fact.Invoices ADD CONSTRAINT FK_Fact_Invoices_VatCodeKey FOREIGN KEY (VatCodeKey) REFERENCES Dim.VATCode (VATCodeKey);

END;
GO

INSERT INTO Fact.Invoices
(
    InvoiceDateKey,
    InvoiceYear,
    InvoiceNumber,
    InvoiceID,
    CustomerKey,
    CategoryKey,
    VatCodeKey,
    LineAmount,
    PartialCompensationAmount,
    InvoiceAmount,
    VATAmount,
    TotalAmount,
    WithHoldingTaxAmount,
    NetToPayAmount,
    PaidAmount,
    IsSettled
)
SELECT
    InvoiceDateKey,
    InvoiceYear,
    InvoiceNumber,
    InvoiceID,
    CustomerKey,
    CategoryKey,
    VatCodeKey,
    LineAmount,
    PartialCompensationAmount,
    InvoiceAmount,
    VATAmount,
    TotalAmount,
    WithHoldingTaxAmount,
    NetToPayAmount,
    PaidAmount,
    IsSettled

FROM Fact.InvoicesView
ORDER BY InvoiceDateKey,
    InvoiceID;
GO

SELECT * FROM Dim.Date