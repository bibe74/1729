USE AdventureWorksDW;
GO

/*
SET NOEXEC OFF;
--*/ SET NOEXEC ON;

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = N'Audit')
BEGIN
    EXEC ('CREATE SCHEMA Audit AUTHORIZATION dbo;'); -- Audit: copies of the original tables with extra fields for ETL
END;
GO

DROP TABLE IF EXISTS [Audit].[Package_Control];
GO

CREATE TABLE [Audit].[Package_Control] (
    [Package_NM] [VARCHAR](100) NOT NULL,
    [Package_ID] [UNIQUEIDENTIFIER] NOT NULL,
    [Parent_Package_ID] [UNIQUEIDENTIFIER] NULL,
    [Execution_ID] [BIGINT] NULL,
    [Start_TS] [DATETIME] NOT NULL,
    [Stop_TS] [DATETIME] NULL,
    [Insert_Row_QT] [INT] NULL,
    [Update_Row_QT] [INT] NULL,
    [Unchanged_Row_QT] [INT] NULL,
    [Deleted_Row_QT] [INT] NULL,
    [Duration_s] AS (DATEDIFF(SECOND, [Start_TS], [Stop_TS])),
    [PackageLogID] [INT] IDENTITY(1, 1) NOT NULL
);
GO

CREATE OR ALTER PROCEDURE [Audit].[PackageControlStart] (
    @PackageName VARCHAR(100),
    @PackageId UNIQUEIDENTIFIER,
    @ParentPackageId UNIQUEIDENTIFIER = NULL,
    @ExecutionId BIGINT,
    @StartTime DATETIME,
    @StopTime DATETIME = NULL,
    @InsertRowQuantity INT = NULL,
    @UpdateRowQuantity INT = NULL,
    @UnchangedRowQuantity INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @PackageLogId INT;
    INSERT INTO [Audit].[Package_Control] (
        [Package_NM],
        [Package_ID],
        [Parent_Package_ID],
        [Execution_ID],
        [Start_TS],
        [Stop_TS],
        [Insert_Row_QT],
        [Update_Row_QT],
        [Unchanged_Row_QT]
    )
    SELECT
        @PackageName,
        @PackageId,
        @ParentPackageId,
        @ExecutionId,
        CURRENT_TIMESTAMP,
        @StopTime,
        @InsertRowQuantity,
        @UpdateRowQuantity,
        @UnchangedRowQuantity;
    SELECT
        @PackageLogId = SCOPE_IDENTITY();
    SELECT
        @PackageLogId AS PackageLogID;
END;
GO

CREATE OR ALTER PROCEDURE [Audit].[PackageControlStop] (
    @PackageId UNIQUEIDENTIFIER,
    @ExecutionId BIGINT,
    @InsertRowQuantity INT = NULL,
    @UpdateRowQuantity INT = NULL,
    @UnchangedRowQuantity INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;
    -- Close out the execution.
    UPDATE
        PC
    SET
        [Stop_TS] = CURRENT_TIMESTAMP,
        [Insert_Row_QT] = @InsertRowQuantity,
        [Update_Row_QT] = @UpdateRowQuantity,
        [Unchanged_Row_QT] = @UnchangedRowQuantity
    FROM [Audit].[Package_Control] AS PC
    WHERE PC.Package_ID = @PackageId
          AND PC.Execution_ID = @ExecutionId
          AND PC.[Stop_TS] IS NULL;
END;
GO
