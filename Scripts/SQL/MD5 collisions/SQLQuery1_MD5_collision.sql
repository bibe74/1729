DROP TABLE IF EXISTS dbo.SourceTable;
GO

IF OBJECT_ID('dbo.SourceTable', 'U') IS NULL
BEGIN

    CREATE TABLE dbo.SourceTable (
        f0 VARCHAR(40) NOT NULL CONSTRAINT PK_SourceTable PRIMARY KEY CLUSTERED,
        f1 VARCHAR(40) NULL,
        f2 VARCHAR(40) NULL,
        f3 VARCHAR(40) NULL,
        f4 VARCHAR(40) NULL,
        f5 VARCHAR(40) NULL,
        f6 VARCHAR(40) NULL,
        f7 VARCHAR(40) NULL,
        f8 VARCHAR(40) NULL,
        f9 VARCHAR(40) NULL,
        f10 VARCHAR(40) NULL,
        f11 VARCHAR(40) NULL,
        f12 VARCHAR(40) NULL,
        f13 VARCHAR(40) NULL,
        f14 VARCHAR(40) NULL,
        f15 VARCHAR(40) NULL,
        f16 VARCHAR(40) NULL
    );

    INSERT INTO dbo.SourceTable (
        f0,
        f1,
        f2,
        f3,
        f4,
        f5,
        f6,
        f7,
        f8,
        f9,
        f10,
        f11,
        f12,
        f13,
        f14,
        f15,
        f16
    ) VALUES (
        'First',   -- f0 - varchar(40)
        'd131dd02c5e6eec4693d9a0698aff95c2fcab5',
        '8',
        '712467eab4004583eb8fb7f89',
        '55ad340609f4b30283e4888325',
        '7',
        '1415a085125e8f7cdc99fd91dbd',
        'f',
        '280373c5b',
        'd8823e3156348f5bae6dacd436c919c6dd53e2',
        'b',
        '487da03fd02396306d248cda0',
        'e99f33420f577ee8ce54b67080',
        'a',
        '80d1ec69821bcb6a8839396f965',
        '2',
        'b6ff72a70'
    );    

END;
GO

SELECT f0,
       CONCAT(
       '0x',
       f1,
       f2,
       f3,
       f4,
       f5,
       f6,
       f7,
       f8,
       f9,
       f10,
       f11,
       f12,
       f13,
       f14,
       f15,
       f16),
        'd131dd02c5e6eec4693d9a0698aff95c2fcab5',
        '8',
        '712467eab4004583eb8fb7f89',
        '55ad340609f4b30283e4888325',
        '7',
        '1415a085125e8f7cdc99fd91dbd',
        'f',
        '280373c5b',
        'd8823e3156348f5bae6dacd436c919c6dd53e2',
        'b',
        '487da03fd02396306d248cda0',
        'e99f33420f577ee8ce54b67080',
        'a',
        '80d1ec69821bcb6a8839396f965',
        '2',
        'b6ff72a70'

FROM dbo.SourceTable

CREATE OR ALTER VIEW dbo.DimSourceTableView
AS
SELECT
    -- Primary key
    ST.f0,

    -- Data warehouse fields
    CURRENT_TIMESTAMP AS InsertedDatetime,
    CURRENT_TIMESTAMP AS UpdatedDatetime,
    CONVERT(VARBINARY(200), CONCAT(
        '0x',
        ST.f1,
        ST.f2,
        ST.f3,
        ST.f4,
        ST.f5,
        ST.f6,
        ST.f7,
        ST.f8,
        ST.f9,
        ST.f10,
        ST.f11,
        ST.f12,
        ST.f13,
        ST.f14,
        ST.f15,
        ST.f16
    )) AS ChangeHashKey,
    CAST(0 AS BIT) AS IsDeleted,

    ST.f1,
    ST.f2,
    ST.f3,
    ST.f4,
    ST.f5,
    ST.f6,
    ST.f7,
    ST.f8,
    ST.f9,
    ST.f10,
    ST.f11,
    ST.f12,
    ST.f13,
    ST.f14,
    ST.f15,
    ST.f16

FROM dbo.SourceTable ST;
GO

--DROP TABLE IF EXISTS dbo.DimSourceTable;
GO

IF OBJECT_ID('dbo.DimSourceTable', 'U') IS NULL
BEGIN

    SELECT TOP (0) * INTO dbo.DimSourceTable FROM dbo.DimSourceTableView;

    ALTER TABLE dbo.DimSourceTable ADD CONSTRAINT PK_DimSourceTable PRIMARY KEY CLUSTERED (f0);

END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_Merge_DimSourceTable
AS
BEGIN

    SET NOCOUNT ON;

    MERGE INTO dbo.DimSourceTable AS TGT
    USING dbo.DimSourceTableView AS SRC
    ON SRC.f0 = TGT.f0

    WHEN NOT MATCHED THEN INSERT
        VALUES (
            SRC.f0,
            SRC.InsertedDatetime,
            SRC.UpdatedDatetime,
            SRC.ChangeHashKey,
            SRC.IsDeleted,
            SRC.f1,
            SRC.f2,
            SRC.f3,
            SRC.f4,
            SRC.f5,
            SRC.f6,
            SRC.f7,
            SRC.f8,
            SRC.f9,
            SRC.f10,
            SRC.f11,
            SRC.f12,
            SRC.f13,
            SRC.f14,
            SRC.f15,
            SRC.f16
        )

    WHEN MATCHED AND SRC.ChangeHashKey <> TGT.ChangeHashKey THEN UPDATE
        SET TGT.ChangeHashKey = SRC.ChangeHashKey,
            TGT.UpdatedDatetime = SRC.UpdatedDatetime,
            TGT.f1 = SRC.f1,
            TGT.f2 = SRC.f2,
            TGT.f3 = SRC.f3,
            TGT.f4 = SRC.f4,
            TGT.f5 = SRC.f5,
            TGT.f6 = SRC.f6,
            TGT.f7 = SRC.f7,
            TGT.f8 = SRC.f8,
            TGT.f9 = SRC.f9,
            TGT.f10 = SRC.f10,
            TGT.f11 = SRC.f11,
            TGT.f12 = SRC.f12,
            TGT.f13 = SRC.f13,
            TGT.f14 = SRC.f14,
            TGT.f15 = SRC.f15,
            TGT.f16 = SRC.f16

    WHEN NOT MATCHED BY SOURCE THEN UPDATE
        SET TGT.IsDeleted = CAST(1 AS BIT),
            TGT.UpdatedDatetime = CURRENT_TIMESTAMP
    
    OUTPUT $action AS [Action], COALESCE(Inserted.f0, Deleted.f0) AS [f0];

END;
GO

EXEC dbo.usp_Merge_DimSourceTable;
GO

UPDATE dbo.SourceTable
SET f2 = '4'

WHERE f0 = 'First';
GO

EXEC dbo.usp_Merge_DimSourceTable;
GO

UPDATE dbo.SourceTable
SET f2 = '8',
    f5 = '7',
    f7 = 'f',
    f10 = 'b',
    f13 = 'a',
    f15 = '2'

WHERE f0 = 'First';
GO

EXEC dbo.usp_Merge_DimSourceTable;
GO

UPDATE dbo.SourceTable
SET f2 = '0',
    f5 = 'f',
    f7 = '7',
    f10 = '3',
    f13 = '2',
    f15 = 'a'

WHERE f0 = 'First';
GO

EXEC dbo.usp_Merge_DimSourceTable;
GO

UPDATE dbo.SourceTable
SET f2 = '8',
    f5 = '7',
    f7 = 'f',
    f10 = 'b',
    f13 = 'a',
    f15 = '2'

WHERE f0 = 'First';
GO

EXEC dbo.usp_Merge_DimSourceTable;
GO


SELECT
       	CONVERT(VARBINARY(20), HASHBYTES('MD5', CAST(CONCAT(
            '0x',
            'd131dd02c5e6eec4693d9a0698aff95c2fcab5',
            '8',
            '712467eab4004583eb8fb7f89',
            '55ad340609f4b30283e4888325',
            '7',
            '1415a085125e8f7cdc99f d91dbd',
            'f',
            '280373c5b',
            'd8823e3156348f5bae6dacd436c919c6dd53e2',
            'b',
            '487da03fd02396306d248cda0',
            'e99f33420f577ee8ce54b67080',
            'a',
            '80d1ec69821bcb6a8839396f965',
            '2',
            'b6ff72a70') AS VARBINARY)
        )) AS HistoricalHashKey,
        CONVERT(VARBINARY(20), HASHBYTES('MD5', CAST(CONCAT(
            '0x',
            'd131dd02c5e6eec4693d9a0698aff95c2fcab5',
            '0',
            '712467eab4004583eb8fb7f89',
            '55ad340609f4b30283e4888325',
            'f',
            '1415a085125e8f7cdc99fd91dbd',
            '7',
            '280373c5b',
            'd8823e3156348f5bae6dacd436c919c6dd53e2',
            '3',
            '487da03fd02396306d248cda0',
            'e99f33420f577ee8ce54b67080',
            '2',
            '80d1ec69821bcb6a8839396f965',
            'a',
            'b6ff72a70') AS VARBINARY)
        )) AS ChangeHashKey;
