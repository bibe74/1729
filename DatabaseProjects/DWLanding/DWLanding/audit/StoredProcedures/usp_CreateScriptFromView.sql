
CREATE   PROCEDURE audit.usp_CreateScriptFromView (
    @schemaName sysname,
    @viewName sysname
)
AS
BEGIN

    SET NOCOUNT ON;

    DECLARE @tableName sysname = REPLACE(@viewName, 'View', '');

    DROP TABLE IF EXISTS #viewColumns;

    WITH DWHColumns
    AS (
        SELECT 'HistoricalHashKey' AS columnName
        UNION ALL SELECT 'ChangeHashKey'
        UNION ALL SELECT 'HistoricalHashKeyASCII'
        UNION ALL SELECT 'ChangeHashKeyASCII'
        UNION ALL SELECT 'InsertDatetime'
        UNION ALL SELECT 'UpdateDatetime'
        UNION ALL SELECT 'IsDeleted'
    ),
    ViewColumns
    AS (
        SELECT
            C.column_id,
            C.name,
            CASE WHEN DWHC.columnName IS NOT NULL THEN 1 ELSE 0 END AS IsDWHColumn,
            SUM(CASE WHEN DWHC.columnName IS NOT NULL THEN 1 ELSE 0 END) OVER (ORDER BY C.column_id) AS s

        FROM sys.views V
        INNER JOIN sys.schemas S ON S.schema_id = V.schema_id
            AND S.name =  @schemaName
        INNER JOIN sys.columns C ON C.object_id = V.object_id
        LEFT JOIN DWHColumns DWHC ON C.name = DWHC.columnName
        WHERE V.name = @viewName
    )
    SELECT
        VC.column_id,
        VC.name,
        VC.IsDWHColumn,
        CASE
            WHEN VC.IsDWHColumn = 1 THEN 'DWH'
            WHEN VC.s = 0 THEN 'Key'
            ELSE 'Data'
        END AS ColumnType

    INTO #viewColumns

    FROM ViewColumns VC
    ORDER BY VC.column_id;

    --SELECT * FROM #viewColumns;

    DECLARE @keyColumnList NVARCHAR(1000),
        @dataColumnList NVARCHAR(1000),
        @keyColumnScript NVARCHAR(MAX) = N'',
        @dataColumnScript NVARCHAR(MAX) = N'';

    SELECT
        @keyColumnList = LTRIM(STUFF((SELECT ', ' + VC.name
            FROM #viewColumns VC
            WHERE VC.ColumnType = N'Key'
            ORDER BY VC.column_id
            FOR XML PATH('')), 1, 1, '')),
        @dataColumnList = LTRIM(STUFF((SELECT ', ' + VC.name
            FROM #viewColumns VC
            WHERE VC.ColumnType = N'Data'
            ORDER BY VC.column_id
            FOR XML PATH('')), 1, 1, ''));
    
    --SELECT @keyColumnList AS keyColumnList, @dataColumnList AS dataColumnList;

    DECLARE @colName sysname
    
    DECLARE curColumns CURSOR FAST_FORWARD READ_ONLY FOR SELECT name FROM #viewColumns WHERE ColumnType = 'Key' ORDER BY column_id;
    
    OPEN curColumns
    
    FETCH NEXT FROM curColumns INTO @colName
    
    DECLARE @separator NVARCHAR(100) = '';

    WHILE @@FETCH_STATUS = 0
    BEGIN
        
        SELECT @keyColumnScript = @keyColumnScript + @separator + REPLACE('SRC.%C% = TGT.%C%', '%C%', @colName);
        SET @separator = ' AND ';
    
        FETCH NEXT FROM curColumns INTO @colName
    END
    
    CLOSE curColumns
    DEALLOCATE curColumns

    --DECLARE @colName sysname
    
    DECLARE curColumns CURSOR FAST_FORWARD READ_ONLY FOR SELECT name FROM #viewColumns WHERE ColumnType = 'Data' ORDER BY column_id;
    
    OPEN curColumns
    
    FETCH NEXT FROM curColumns INTO @colName
    
    SET @separator = '';

    WHILE @@FETCH_STATUS = 0
    BEGIN
        
        SELECT @dataColumnScript = @dataColumnScript + @separator + REPLACE('TGT.%C% = SRC.%C%', '%C%', @colName);
        SELECT @separator = '
        , ';
    
        FETCH NEXT FROM curColumns INTO @colName
    END
    
    CLOSE curColumns
    DEALLOCATE curColumns

    --SELECT @keyColumnScript, @dataColumnScript;

    PRINT REPLACE(REPLACE(REPLACE(REPLACE(REPLACE('
    --DROP TABLE IF EXISTS %S%.%T%;
    GO

    IF OBJECT_ID(N''%S%.%T%'', N''U'') IS NULL
    BEGIN
        SELECT TOP 0 * INTO %S%.%T% FROM %S%.%T%View;

        --ALTER TABLE %S%.%T% ALTER COLUMN <nullable_column> <type> NOT NULL;

        ALTER TABLE %S%.%T% ADD CONSTRAINT PK_%S%_%T% PRIMARY KEY CLUSTERED (UpdateDatetime, %KCL%);

        CREATE UNIQUE NONCLUSTERED INDEX IX_%S%_%T%_BusinessKey ON %S%.%T% (%KCL%);
        --CREATE UNIQUE NONCLUSTERED INDEX IX_%S%.%T%_AlternateKey ON %S%.%T% ();
    END;
    GO
    
',
    '%S%', @schemaName),
    '%T%', @tableName),
    '%KCL%', @keyColumnList),
    '%KCS%', @keyColumnScript),
    '%DCS%', @dataColumnScript);

    PRINT REPLACE(REPLACE(REPLACE(REPLACE(REPLACE('
    CREATE OR ALTER PROCEDURE %S%.usp_Merge_%T%
    AS
    BEGIN
    SET NOCOUNT ON;

    MERGE INTO %S%.%T% AS TGT
    USING %S%.%T%View AS SRC
    ON %KCS%

    WHEN MATCHED AND (SRC.ChangeHashKeyASCII <> TGT.ChangeHashKeyASCII)
      THEN UPDATE SET
        TGT.ChangeHashKey = SRC.ChangeHashKey,
        TGT.ChangeHashKeyASCII = SRC.ChangeHashKeyASCII,
        --TGT.InsertDatetime = SRC.InsertDatetime,
        TGT.UpdateDatetime = SRC.UpdateDatetime,
        TGT.IsDeleted = SRC.IsDeleted,
        %DCS%

    WHEN NOT MATCHED AND SRC.IsDeleted = CAST(0 AS BIT)
      THEN INSERT VALUES (
        SRC.*
      )

    WHEN NOT MATCHED BY SOURCE
        AND TGT.IsDeleted = CAST(0 AS BIT)
      --THEN UPDATE SET TGT.IsDeleted = CAST(1 AS BIT),
      --  TGT.ChangeHashKey = CONVERT(VARBINARY(20), ''''),
      --  TGT.ChangeHashKeyASCII = ''''
      THEN DELETE

    OUTPUT
        CURRENT_TIMESTAMP AS merge_datetime,
        ----$action AS merge_action,
        CASE WHEN Inserted.IsDeleted = CAST(1 AS BIT) THEN N''DELETE'' ELSE $action END AS merge_action,
        ''%S%.%T%'' AS full_olap_table_name,
        ''<keycolumn> = '' + CAST(COALESCE(inserted.<keycolumn>, deleted.<keycolumn>) AS NVARCHAR) AS primary_key_description
    INTO audit.merge_log_details;

    END;
    GO

    --EXEC %S%.usp_Merge_%T%;
    GO

',
    '%S%', @schemaName),
    '%T%', @tableName),
    '%KCL%', @keyColumnList),
    '%KCS%', @keyColumnScript),
    '%DCS%', @dataColumnScript);

END;
GO

