/**
 * @storedprocedure audit.usp_CreateScriptFromTableView
*/

CREATE   PROCEDURE audit.usp_CreateScriptFromTableView (
    @schemaName sysname,
    @tableName sysname
)
AS
BEGIN

    --DECLARE @schemaName sysname = 'ROBINHOOD', @tableName sysname = 'dbo_CompanyConsultant';

    SET NOCOUNT ON;

    DECLARE @viewName sysname = CONCAT(@tableName, 'View');
    DECLARE @viewFullName sysname = CONCAT(@schemaName, '.', @viewName);

    IF OBJECT_ID(@viewFullName, 'V') IS NULL
    BEGIN
        RAISERROR('ERROR: view %s does not exist. Exiting', 16, 1, @viewFullName);
        RETURN;
    END;

    DROP TABLE IF EXISTS #DWHColumns;

    SELECT
        'HistoricalHashKey' AS columnName

    INTO #DWHColumns

    UNION ALL SELECT 'HistoricalHashKeyASCII'
    UNION ALL SELECT 'ChangeHashKey'
    UNION ALL SELECT 'ChangeHashKeyASCII'
    UNION ALL SELECT 'InsertDatetime'
    UNION ALL SELECT 'UpdateDatetime'
    UNION ALL SELECT 'IsDeleted';

    DROP TABLE IF EXISTS #viewColumns;

    SELECT
        c.column_id,
        c.name AS ColumnName,
        ty.name AS DataType,
        c.max_length,
        c.precision,
        c.scale,
        c.is_nullable
    
    INTO #viewColumns
    FROM sys.views v
    INNER JOIN sys.schemas S ON S.schema_id = v.schema_id
        AND S.name = @schemaName
    INNER JOIN sys.columns c ON v.object_id = c.object_id
    INNER JOIN sys.types ty ON c.user_type_id = ty.user_type_id
    WHERE v.name = @viewName
    ORDER BY c.column_id;

    DECLARE @minDWHColumnID INT,
        @maxDWHColumnID INT,
        @ChangeHashKeyColumn NVARCHAR(128) = 'ChangeHashKey',
        @ChangeHashKeyColumnID INT;

    SELECT
        @minDWHColumnID = MIN(C.column_id),
        @maxDWHColumnID = MAX(C.column_id),
        @ChangeHashKeyColumnID = MAX(CASE WHEN C.ColumnName = @ChangeHashKeyColumn THEN C.column_id ELSE NULL END)

    FROM #viewColumns C
    INNER JOIN #DWHColumns DWHC ON DWHC.columnName = C.ColumnName;

    IF (@minDWHColumnID IS NULL)
    BEGIN
        RAISERROR('ERROR: no DWH columns in view %s. Exiting', 16, 1, @viewFullName);
        RETURN;
    END;

    IF (@ChangeHashKeyColumnID IS NULL)
    BEGIN
        RAISERROR('ERROR: no %s column in view %s. Exiting', 16, 1, @ChangeHashKeyColumn, @viewFullName);
        RETURN;
    END;

    DECLARE @TargetTableSchema NVARCHAR(128) = @schemaName;
    DECLARE @TargetTableName NVARCHAR(128) = @tableName;
    DECLARE @MergeSPName NVARCHAR(256) = 'usp_Merge_' + @tableName;

    DECLARE @SchemaAndName NVARCHAR(256) = @viewFullName;
    DECLARE @TargetSchemaAndName NVARCHAR(256) = @TargetTableSchema + '.' + @TargetTableName;
    DECLARE @MergeSPSchemaAndName NVARCHAR(256) = @TargetTableSchema + '.' + @MergeSPName;

    DECLARE @SQLScript NVARCHAR(MAX) = '';
    --DECLARE @ColumnDefsForTable NVARCHAR(MAX) = '';
    DECLARE @PKColumnsList NVARCHAR(MAX) = '';
    DECLARE @DWHColumnsListForUpdate NVARCHAR(MAX) = '';
    DECLARE @NonPKColumnsListForUpdate NVARCHAR(MAX) = '';
    DECLARE @PKColumnsListForLog NVARCHAR(MAX) = '';
    DECLARE @AllColumnsList NVARCHAR(MAX) = '';
    DECLARE @JoinCondition NVARCHAR(MAX) = '';
    DECLARE @FirstPKColumn NVARCHAR(128);

    -- Genera le definizioni delle colonne per la tabella e le liste di colonne
    SELECT
        @AllColumnsList = @AllColumnsList + VC.ColumnName + ',',
        @FirstPKColumn = CASE WHEN VC.column_id = 1 THEN VC.ColumnName ELSE @FirstPKColumn END,
        @PKColumnsList = @PKColumnsList +
            CASE
                WHEN column_id < @minDWHColumnID THEN VC.ColumnName + ','
                ELSE ''
            END,
        @NonPKColumnsListForUpdate = @NonPKColumnsListForUpdate +
            CASE
                WHEN VC.column_id > @maxDWHColumnID THEN 'TGT.' + VC.ColumnName + ' = SRC.' + VC.ColumnName + ','
                ELSE ''
            END,
        @DWHColumnsListForUpdate = @DWHColumnsListForUpdate +
            CASE
                WHEN VC.column_id BETWEEN @minDWHColumnID AND @maxDWHColumnID AND (VC.ColumnName IN ('UpdateDatetime', 'IsDeleted') OR LEFT(VC.ColumnName, LEN(@ChangeHashKeyColumn)) = @ChangeHashKeyColumn) THEN 'TGT.' + VC.ColumnName + ' = SRC.' + VC.ColumnName + ','
                ELSE ''
            END,
        @JoinCondition = @JoinCondition +
            CASE
                WHEN VC.column_id < @minDWHColumnID THEN ' SRC.' + VC.ColumnName + ' = TGT.' + VC.ColumnName + ' AND'
                ELSE ''
            END,
        @PKColumnsListForLog = @PKColumnsListForLog + CASE WHEN VC.column_id < @minDWHColumnID THEN ' + ''' + VC.ColumnName + ' = '' + CAST(COALESCE(inserted.' + VC.ColumnName + ', deleted.' + VC.ColumnName + ') AS NVARCHAR)' ELSE '' END

    FROM #ViewColumns VC
    ORDER BY VC.column_id;

    SET @AllColumnsList = LEFT(@AllColumnsList, LEN(@AllColumnsList) - 1); -- Rimuove la virgola finale
    SET @PKColumnsList = LEFT(@PKColumnsList, LEN(@PKColumnsList) - 1); -- Rimuove la virgola finale
    SET @NonPKColumnsListForUpdate = LEFT(@NonPKColumnsListForUpdate, LEN(@NonPKColumnsListForUpdate) - CASE WHEN LEN(@NonPKColumnsListForUpdate) = 0 THEN 0 ELSE 1 END); -- Rimuove la virgola finale
    SET @PKColumnsListForLog = RIGHT(@PKColumnsListForLog, LEN(@PKColumnsListForLog) - 2); -- Rimuove ', ' iniziale
    SET @JoinCondition = LEFT(@JoinCondition, LEN(@JoinCondition) - 3); -- Rimuove ' AND' finale

    SET @SQLScript = '--DROP TABLE IF EXISTS ' + @TargetSchemaAndName + ';
GO

IF OBJECT_ID(''' + @TargetSchemaAndName + ''', ''U'') IS NULL
BEGIN
    SELECT TOP (0) * INTO ' + @TargetSchemaAndName + ' FROM ' + @SchemaAndName + ';

    --ALTER TABLE ' + @TargetSchemaAndName + ' ALTER COLUMN <nullable_column> <type> NOT NULL;

    ALTER TABLE ' + @TargetSchemaAndName + ' ADD CONSTRAINT PK_' + @schemaName + '_' + @tableName + ' PRIMARY KEY CLUSTERED (UpdateDatetime, ' + REPLACE(@PKColumnsList, ',', ', ') + ');

    CREATE UNIQUE NONCLUSTERED INDEX IX_' + @schemaName + '_' + @tableName + '_BusinessKey ON ' + @TargetSchemaAndName + ' (' + REPLACE(@PKColumnsList, ',', ', ') + ');
    --CREATE UNIQUE NONCLUSTERED INDEX IX_' + @schemaName + '_' + @tableName + '_AlternateKey ON ' + @TargetSchemaAndName + ' ();
END;
GO

CREATE OR ALTER PROCEDURE ' + @MergeSPSchemaAndName + '
AS
BEGIN
    SET NOCOUNT ON;

    MERGE INTO ' + @TargetSchemaAndName + ' AS TGT
    USING ' + @SchemaAndName + ' AS SRC ON (
        ' + @JoinCondition + '
    )

    WHEN MATCHED AND SRC.' + @ChangeHashKeyColumn + ' <> TGT.' + @ChangeHashKeyColumn + '
      THEN UPDATE SET ' + CASE WHEN LEN(@NonPKColumnsListForUpdate) = 0 THEN LEFT(REPLACE(@DWHColumnsListForUpdate, ',', ', '), LEN(REPLACE(@DWHColumnsListForUpdate, ',', ', ')) - 1) ELSE + REPLACE(@DWHColumnsListForUpdate, ',', ', ') + '
        ' + REPLACE(@NonPKColumnsListForUpdate, ',', ', ') END + '

    WHEN NOT MATCHED BY TARGET
      THEN INSERT (' + REPLACE(@AllColumnsList, ',', ', ') + ')
        VALUES (' + REPLACE(@AllColumnsList, ',', ', ') + ')

    WHEN NOT MATCHED BY SOURCE AND TGT.IsDeleted = CAST(0 AS BIT)
      THEN UPDATE SET TGT.' + @ChangeHashKeyColumn + ' = CONVERT(VARBINARY(32), 0),
        TGT.UpdateDatetime = CURRENT_TIMESTAMP,
        TGT.IsDeleted = CAST(1 AS BIT)
    
    OUTPUT
        CURRENT_TIMESTAMP AS merge_datetime,
        CASE WHEN Inserted.IsDeleted = CAST(1 AS BIT) THEN N''DELETE'' ELSE $action END AS merge_action,
        ''' + @TargetSchemaAndName + ''' AS full_olap_table_name,
        ' + @PKColumnsListForLog + ' AS primary_key_description
    INTO audit.merge_log_details;

END
GO

EXEC ' + @MergeSPSchemaAndName + ';
GO
';

    SELECT @SQLScript AS GeneratedSyncScript;

    DROP TABLE #ViewColumns;

    DROP TABLE IF EXISTS #DWHColumns;

END;
GO

