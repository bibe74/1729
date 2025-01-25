/*
SET NOEXEC OFF;
--*/ SET NOEXEC ON;
GO

USE WWIDWH;
GO

CREATE TABLE Staging.SalesReason (
    SalesReasonID INT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    ReasonType NVARCHAR(50) NOT NULL,
    ModifiedDate DATETIME NOT NULL
);
GO

CREATE TABLE Dim.SalesReason (
    SalesReasonKey INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Dim_SalesReason PRIMARY KEY CLUSTERED,

    SalesReasonID INT NOT NULL,

    HistoricalHashKey VARBINARY(20) NOT NULL,
    ChangeHashKey VARBINARY(20) NOT NULL,
    InsertDatetime DATETIME NOT NULL,
    UpdateDatetime DATETIME NULL,
    IsDeleted BIT NOT NULL CONSTRAINT DFT_Dim_SalesReason_IsDeleted DEFAULT (0),

    SalesReasonName NVARCHAR(50) NOT NULL,
    SalesReasonType NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE Updt.SalesReason (
    SalesReasonID INT NOT NULL,

    HistoricalHashKey VARBINARY(20) NOT NULL,
    ChangeHashKey VARBINARY(20) NOT NULL,
    InsertDatetime DATETIME NOT NULL,

    SalesReasonName NVARCHAR(50) NOT NULL,
    SalesReasonType NVARCHAR(50) NOT NULL
);
GO
