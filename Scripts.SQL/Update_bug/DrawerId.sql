--DROP TABLE IF EXISTS dbo.Requests; DROP TABLE IF EXISTS dbo.Drawers;
GO

IF OBJECT_ID('dbo.Drawers', 'U') IS NULL
BEGIN

    CREATE TABLE dbo.Drawers (
        Id INT NOT NULL IDENTITY(1, 1) CONSTRAINT PK_Drawers PRIMARY KEY CLUSTERED,
        Name NVARCHAR(200) NOT NULL,
        ZoneId INT NULL,
        PositionIndex INT NULL
    );

    INSERT INTO dbo.Drawers (
        Name,
        ZoneId,
        PositionIndex
    )
    VALUES (N'Uno', NULL, 0),
        (N'Due', 1, 2),
        (N'Tre', 3, 4);


END;
GO

IF OBJECT_ID('dbo.Requests', 'U') IS NULL
BEGIN

    CREATE TABLE dbo.Requests (
        Id INT NOT NULL IDENTITY(1, 1) CONSTRAINT PK_Requests PRIMARY KEY CLUSTERED,
        Name NVARCHAR(200) NOT NULL,
        DrawerId INT NOT NULL CONSTRAINT FK_Requests_DrawerId REFERENCES dbo.Drawers(Id),
        LastUpdateDate DATETIME NULL
    );

    INSERT INTO dbo.Requests (
        Name,
        DrawerId,
        LastUpdateDate
    )
    VALUES (N'Prima', 1, CURRENT_TIMESTAMP),
        (N'Seconda', 2, CURRENT_TIMESTAMP),
        (N'Terza', 3, CURRENT_TIMESTAMP);

END;
GO

SELECT * FROM dbo.Drawers;
SELECT * FROM dbo.Requests;
GO

-- Query OK
DECLARE @ZoneId INT = 1;
SELECT Id FROM dbo.Drawers WHERE ZoneId = @ZoneId;
GO

-- Query KO: Invalid column name 'DrawerId'
DECLARE @ZoneId INT = 1;
SELECT DrawerId FROM dbo.Drawers WHERE ZoneId = @ZoneId;
GO

-- Updates one record > OK
DECLARE @ZoneId INT = 1;
UPDATE dbo.Requests
SET DrawerId = ( SELECT TOP (1) Id FROM dbo.Drawers WHERE ZoneId IS NULL AND PositionIndex = 0 ORDER BY Id ),
    LastUpdateDate = GETUTCDATE()
WHERE DrawerId IN ( SELECT Id FROM dbo.Drawers WHERE ZoneId = @ZoneId );
GO

-- Updates zero records > OK
UPDATE dbo.Requests
SET DrawerId = ( SELECT TOP (1) Id FROM dbo.Drawers WHERE ZoneId IS NULL AND PositionIndex = 0 ORDER BY Id ),
    LastUpdateDate = GETUTCDATE()
WHERE DrawerId IN ( NULL );
GO

-- Updates all records > ?!?
DECLARE @ZoneId INT = 1;
UPDATE dbo.Requests
SET DrawerId = ( SELECT TOP (1) Id FROM dbo.Drawers WHERE ZoneId IS NULL AND PositionIndex = 0 ORDER BY Id ),
    LastUpdateDate = GETUTCDATE()
WHERE DrawerId IN ( SELECT DrawerId FROM dbo.Drawers WHERE ZoneId = @ZoneId );
GO

DECLARE @ZoneId INT = 1;
UPDATE R
SET R.DrawerId = ( SELECT TOP (1) Id FROM dbo.Drawers WHERE ZoneId IS NULL AND PositionIndex = 0 ORDER BY Id ),
    R.LastUpdateDate = GETUTCDATE()
FROM dbo.Requests R
WHERE EXISTS ( SELECT D.DrawerId FROM dbo.Drawers D WHERE D.DrawerId = R.DrawerId AND ZoneId = @ZoneId );
GO

DECLARE @ZoneId INT = 1;
UPDATE R
SET R.DrawerId = ( SELECT TOP (1) Id FROM dbo.Drawers WHERE ZoneId IS NULL AND PositionIndex = 0 ORDER BY Id ),
    R.LastUpdateDate = GETUTCDATE()
FROM dbo.Requests R
WHERE EXISTS ( SELECT D.Id FROM dbo.Drawers D WHERE D.Id = R.DrawerId AND ZoneId = @ZoneId );
GO

DECLARE @ZoneId INT = 1;
UPDATE R
SET R.DrawerId = (SELECT TOP(1) Id FROM dbo.Drawers WHERE ZoneId IS NULL AND PositionIndex = 0 ORDER BY Id)
    , R.LastUpdateDate = GETUTCDATE()

FROM dbo.Requests R
INNER JOIN dbo.Drawers D ON D.Id = R.DrawerId 
    AND D.ZoneId = @ZoneId;
GO

DECLARE @ZoneId INT = 1;
UPDATE R
SET R.DrawerId = (SELECT TOP(1) DrawerId FROM dbo.Drawers WHERE ZoneId IS NULL AND PositionIndex = 0 ORDER BY Id)
    , R.LastUpdateDate = GETUTCDATE()

FROM dbo.Requests R
INNER JOIN dbo.Drawers D ON D.Id = R.DrawerId 
    AND D.ZoneId = @ZoneId;
GO

SELECT * FROM dbo.Requests;
GO

-- Cleanup
DROP TABLE IF EXISTS dbo.Requests; DROP TABLE IF EXISTS dbo.Drawers;
GO
