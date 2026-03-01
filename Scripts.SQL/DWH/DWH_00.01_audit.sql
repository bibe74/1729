USE DWH;
GO

/*
SET NOEXEC OFF;
--*/ SET NOEXEC ON;
GO

IF SCHEMA_ID('audit') IS NULL EXEC('CREATE SCHEMA audit AUTHORIZATION dbo;');
GO

/**
 * @table audit.merge_log_details
 * @description Origini dati e relativi schemi

*/

CREATE OR ALTER PROCEDURE audit.usp_Create_audit_merge_log_details
AS
BEGIN

    SET NOCOUNT ON;

    IF OBJECT_ID('audit.merge_log_details', 'U') IS NOT NULL DROP TABLE audit.merge_log_details;

    CREATE TABLE audit.merge_log_details (
	    merge_datetime				DATETIME CONSTRAINT DFT_audit_merge_log_details_merge_datetime DEFAULT(CURRENT_TIMESTAMP) NOT NULL,
	    merge_action				NVARCHAR(10) NOT NULL,
	    full_olap_table_name		NVARCHAR(261) NOT NULL,
	    primary_key_description		NVARCHAR(1000) NOT NULL
    );

    CREATE NONCLUSTERED INDEX IX_audit_merge_log_details ON audit.merge_log_details (merge_datetime, merge_action, full_olap_table_name);

END;
GO

IF OBJECT_ID('audit.merge_log_details', 'U') IS NULL EXEC audit.usp_Create_audit_merge_log_details;
GO

/**
 * @table audit.merge_log
 * @description Origini dati e relativi schemi

*/

CREATE OR ALTER VIEW audit.merge_logView
AS
SELECT
	merge_datetime,
	full_olap_table_name,
	COALESCE([1], 0) AS inserted_rows, COALESCE([2], 0) AS updated_rows, COALESCE([3], 0) AS deleted_rows

FROM (
	SELECT
		MLD.merge_datetime,
		MLD.full_olap_table_name,
		A.merge_action_id,
		1 AS recordCount

	FROM audit.merge_log_details MLD
	INNER JOIN (
		SELECT 1 AS merge_action_id, 'INSERT' AS merge_action
		UNION ALL SELECT 2, 'UPDATE'
		UNION ALL SELECT 3, 'DELETE'
	) A ON MLD.merge_action = A.merge_action
) AS SourceTable
PIVOT (
	COUNT(SourceTable.recordCount)
	FOR merge_action_id IN ([1], [2], [3])
) AS PivotTable;
GO

CREATE OR ALTER PROCEDURE audit.usp_Create_audit_merge_log
AS
BEGIN

    SET NOCOUNT ON;

    IF OBJECT_ID('audit.merge_log', 'U') IS NOT NULL DROP TABLE audit.merge_log;

    CREATE TABLE audit.merge_log (
	    merge_datetime				DATETIME CONSTRAINT DFT_audit_merge_log_merge_datetime DEFAULT(CURRENT_TIMESTAMP) NOT NULL,
	    full_olap_table_name		NVARCHAR(261) NOT NULL,
	    inserted_rows				INT CONSTRAINT DFT_audit_merge_log_inserted_rows DEFAULT(0) NOT NULL,
	    updated_rows				INT CONSTRAINT DFT_audit_merge_log_updated_rows DEFAULT(0) NOT NULL,
	    deleted_rows				INT CONSTRAINT DFT_audit_merge_log_deleted_rows DEFAULT(0) NOT NULL,

	    CONSTRAINT PK_audit_merge_log PRIMARY KEY CLUSTERED (
		    merge_datetime,
		    full_olap_table_name
	    )
    );

END;
GO

IF OBJECT_ID('audit.merge_log', 'U') IS NULL EXEC audit.usp_Create_audit_merge_log;
GO

/**
 * @stored_procedure audit.usp_compact_merge_log
 * @description Script per consolidamento log delle operazione merge
*/

IF OBJECT_ID('audit.usp_compact_merge_log', 'P') IS NOT NULL DROP PROCEDURE audit.usp_compact_merge_log;
GO

CREATE PROCEDURE audit.usp_compact_merge_log
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO audit.merge_log
    SELECT * FROM audit.merge_logView
    ORDER BY merge_datetime,
	    full_olap_table_name;

    TRUNCATE TABLE audit.merge_log_details;

END;
GO

--EXEC audit.usp_compact_merge_log;
GO

/**
 * @table audit.EventLog
 * @description Tabella per il log degli eventi

*/

--DROP TABLE audit.EventLog;
GO

IF OBJECT_ID('audit.EventLog', 'U') IS NULL
BEGIN

    CREATE TABLE audit.EventLog
    (
	    -- Chiavi
	    PKEventLog					BIGINT NOT NULL IDENTITY(1, 1) CONSTRAINT PK_EventLog PRIMARY KEY CLUSTERED,

	    -- Attributi
	    EventTimeStamp				DATETIME NOT NULL CONSTRAINT DFT_EventLog_EventTimeStamp DEFAULT (CURRENT_TIMESTAMP),
	    IsElaborationStart			BIT NOT NULL CONSTRAINT DFT_EventLog_IsElaborationStart DEFAULT (0),
	    PKEventSubElaboration		BIGINT,
	    LogMessage					NVARCHAR(255) NOT NULL,
	    NumberOfRows				INT,
	    TimeElapsedElaboration		INT,
	    TimeElapsedSubElaboration	INT,
	    TimeElapsedInstruction		INT
    );

    INSERT INTO audit.EventLog (LogMessage) VALUES ('audit.EventLog first record, inserted on ' + CONVERT(NVARCHAR, CURRENT_TIMESTAMP, 13));

END;
GO

/**
 * @table audit.EventSubElaboration
 * @description Tabella per il log degli eventi

*/

--DROP TABLE audit.EventSubElaboration;
GO

IF OBJECT_ID('audit.EventSubElaboration', 'U') IS NULL
BEGIN

    CREATE TABLE audit.EventSubElaboration
    (
	    -- Chiavi
	    PKEventSubElaboration	BIGINT NOT NULL IDENTITY(1, 1) CONSTRAINT PK_EventSubElaboration PRIMARY KEY CLUSTERED,

	    -- Attributi
	    TimeStart				DATETIME NOT NULL CONSTRAINT DFT_EventSubElaboration_TimeStart DEFAULT (CURRENT_TIMESTAMP)
    );

END;
GO

/**
 * @stored_procedure audit.usp_LogEvent
 * @description

*/

CREATE OR ALTER PROCEDURE audit.usp_LogEvent
	@LogMessage				NVARCHAR(255),
	@PKEventSubElaboration	BIGINT OUTPUT,
	@IsElaborationStart		BIT = 0,
	@NumberOfRows			INT = 0
AS
BEGIN

    SET NOCOUNT ON;

    IF (@IsElaborationStart = 1 OR @PKEventSubElaboration IS NULL)
    BEGIN
	    IF (@LogMessage IS NULL)
	    BEGIN
		    SET @LogMessage = N'Inizio elaborazione ' + FORMAT(CURRENT_TIMESTAMP, N'dd/MM/yyyy hh:mm:ss');
	    END;
	    INSERT INTO audit.EventSubElaboration (TimeStart) VALUES (CURRENT_TIMESTAMP);
	    SET @PKEventSubElaboration = SCOPE_IDENTITY();
    END

    IF (@IsElaborationStart = 1)
	BEGIN
		INSERT INTO audit.EventLog (IsElaborationStart, PKEventSubElaboration, LogMessage) VALUES (1, @PKEventSubElaboration, @LogMessage);
	END;
    ELSE
	BEGIN
		WITH LastElaboration
		AS (
			SELECT TOP 1 EventTimeStamp FROM audit.EventLog WHERE IsElaborationStart = 1 ORDER BY PKEventLog DESC
		),
		LastSubElaboration
		AS (
			SELECT TOP 1 PKEventSubElaboration, TimeStart FROM audit.EventSubElaboration WHERE PKEventSubElaboration = @PKEventSubElaboration
		),
		LastEventLog
		AS (
			SELECT TOP 1 EventTimeStamp, PKEventSubElaboration FROM audit.EventLog ORDER BY PKEventLog DESC
		)
		INSERT INTO audit.EventLog (PKEventSubElaboration, LogMessage, NumberOfRows, TimeElapsedElaboration, TimeElapsedSubElaboration, TimeElapsedInstruction)
		SELECT
			@PKEventSubElaboration,
			@LogMessage AS LogMessage,
			@NumberOfRows AS NumberOfRows,
			DATEDIFF(ss, LE.EventTimeStamp, CURRENT_TIMESTAMP) AS TimeElapsedElaboration,
			DATEDIFF(ss, COALESCE(LSE.TimeStart, CURRENT_TIMESTAMP), CURRENT_TIMESTAMP) AS TimeElapsedSubElaboration,
			DATEDIFF(ss, LEL.EventTimeStamp, CURRENT_TIMESTAMP) AS TimeElapsedInstruction

		FROM LastElaboration LE
		CROSS JOIN LastEventLog LEL
		LEFT JOIN LastSubElaboration LSE ON LEL.PKEventSubElaboration = LSE.PKEventSubElaboration;
	END;
END;
GO

/**
 * @stored_procedure audit.usp_LastLog
*/

CREATE OR ALTER PROCEDURE audit.usp_LastLog
AS
BEGIN

    SET NOCOUNT ON;

    DECLARE @LastPKEventLog BIGINT;

    SELECT @LastPKEventLog = MAX(PKEventLog) FROM audit.EventLog (nolock) WHERE IsElaborationStart = 1;

    SELECT
	    EventTimeStamp,
	    LogMessage,
	    NumberOfRows,
	    CONVERT(NVARCHAR, DATEADD(ss, TimeElapsedInstruction, 0), 108) AS InstructionTime,
	    CONVERT(NVARCHAR, DATEADD(ss, TimeElapsedSubElaboration, 0), 108) AS SubElaborationTime,
	    CONVERT(NVARCHAR, DATEADD(ss, TimeElapsedElaboration, 0), 108) AS ElaborationTime
    FROM audit.EventLog (nolock)
    WHERE PKEventLog >= @LastPKEventLog
    ORDER BY PKEventLog DESC;

END;
GO

CREATE OR ALTER VIEW audit.TestView
AS
WITH TableData
AS (
    SELECT
        'test' AS CompanyId,
        'CUS001' AS CustomerId,
        'Customer #001' AS CustomerDescription,
        'IT11111111111' AS VATNumber

    UNION ALL SELECT 'test', 'CUS002', 'Customer #002', 'IT22222222222'
    UNION ALL SELECT 'test', 'CUS003', 'Customer #003', 'IT33333333333'
)
SELECT
    TD.CompanyId,
    TD.CustomerId,

    CONVERT(VARBINARY(32), HASHBYTES('SHA2_256', CONCAT(
        TD.CompanyId,
        TD.CustomerId,
    	' '
    ))) AS HistoricalHashKey,
    CONVERT(VARBINARY(32), HASHBYTES('SHA2_256', CONCAT(
        TD.CustomerDescription,
        TD.VATNumber,
    	' '
    ))) AS ChangeHashKey,
    CURRENT_TIMESTAMP AS InsertDatetime,
    CURRENT_TIMESTAMP AS UpdateDatetime,
    CAST(0 AS BIT) AS IsDeleted,

    TD.CustomerDescription,
    TD.VATNumber
    
FROM TableData TD;
GO

/**
 * @storedprocedure audit.usp_CreateScriptFromTableView
*/

CREATE OR ALTER PROCEDURE audit.usp_CreateScriptFromTableView (
    @schemaName sysname,
    @tableName sysname
)
AS
BEGIN

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
        @PKColumnsListForLog = @PKColumnsListForLog + CASE WHEN VC.column_id < @minDWHColumnID THEN '+ ''' + VC.ColumnName + ' = '' + CAST(COALESCE(inserted.' + VC.ColumnName + ', deleted.' + VC.ColumnName + ') AS NVARCHAR)' ELSE '' END

    FROM #ViewColumns VC
    ORDER BY VC.column_id;

    SET @AllColumnsList = LEFT(@AllColumnsList, LEN(@AllColumnsList) - 1); -- Rimuove la virgola finale
    SET @PKColumnsList = LEFT(@PKColumnsList, LEN(@PKColumnsList) - 1); -- Rimuove la virgola finale
    SET @NonPKColumnsListForUpdate = LEFT(@NonPKColumnsListForUpdate, LEN(@NonPKColumnsListForUpdate) - 1); -- Rimuove la virgola finale
    SET @PKColumnsListForLog = RIGHT(@PKColumnsListForLog, LEN(@PKColumnsListForLog) - 2); -- Rimuove ', ' iniziale
    SET @JoinCondition = LEFT(@JoinCondition, LEN(@JoinCondition) - 3); -- Rimuove ' AND' finale

    SET @SQLScript = @SQLScript + '
--DROP TABLE IF EXISTS ' + @TargetSchemaAndName + ';
GO

IF OBJECT_ID(N''' + @SchemaAndName + ''', N''U'') IS NULL
BEGIN
    SELECT TOP 0 * INTO ' + @TargetSchemaAndName + ' FROM ' + @SchemaAndName + ';

    --ALTER TABLE ' + @TargetSchemaAndName + ' ALTER COLUMN <nullable_column> <type> NOT NULL;

    ALTER TABLE ' + @TargetSchemaAndName + ' ADD CONSTRAINT PK_' + @schemaName + '_' + @ViewName + ' PRIMARY KEY CLUSTERED (UpdateDatetime, ' + REPLACE(@PKColumnsList, ',', ', ') + ');

    CREATE UNIQUE NONCLUSTERED INDEX IX_' + @schemaName + '_' + @ViewName + '_BusinessKey ON ' + @TargetSchemaAndName + ' (' + REPLACE(@PKColumnsList, ',', ', ') + ');
    --CREATE UNIQUE NONCLUSTERED INDEX IX_' + @schemaName + '_' + @ViewName + '_AlternateKey ON ' + @TargetSchemaAndName + ' ();
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

    WHEN MATCHED AND TGT.' + QUOTENAME(@ChangeHashKeyColumn) + ' <> SRC.' + QUOTENAME(@ChangeHashKeyColumn) + ' THEN
        UPDATE SET ' + REPLACE(@DWHColumnsListForUpdate, ',', ', ') + '
        ' + REPLACE(@NonPKColumnsListForUpdate, ',', ', ') + '

    WHEN NOT MATCHED BY TARGET THEN
        INSERT (' + REPLACE(@AllColumnsList, ',', ', ') + ')
        VALUES (' + REPLACE(@AllColumnsList, ',', ', ') + ')

    WHEN NOT MATCHED BY SOURCE AND TGT.IsDeleted = CAST(0 AS BIT) THEN
        UPDATE SET TGT.IsDeleted = CAST(1 AS BIT)
    
    OUTPUT
        CURRENT_TIMESTAMP AS merge_datetime,
        CASE WHEN Inserted.IsDeleted = CAST(1 AS BIT) THEN N''DELETE'' ELSE $action END AS merge_action,
        ''' + @TargetSchemaAndName + ''' AS full_olap_table_name,
        ' + @PKColumnsListForLog + ' AS primary_key_description
    INTO audit.merge_log_details;

END
GO

--EXEC ' + @MergeSPSchemaAndName + ';
GO

';

    SELECT @SQLScript AS GeneratedSyncScript;

    DROP TABLE #ViewColumns;

    DROP TABLE IF EXISTS #DWHColumns;

END;
GO

EXEC audit.usp_CreateScriptFromTableView
    @schemaName = 'audit', -- sysname
    @tableName = 'Test'; -- sysname
GO



--DROP TABLE IF EXISTS audit.Test;
GO

IF OBJECT_ID(N'audit.TestView', N'U') IS NULL
BEGIN
    SELECT TOP 0 * INTO audit.Test FROM audit.TestView;

    --ALTER TABLE audit.Test ALTER COLUMN <nullable_column> <type> NOT NULL;

    ALTER TABLE audit.Test ADD CONSTRAINT PK_audit_TestView PRIMARY KEY CLUSTERED (UpdateDatetime, CompanyId, CustomerId);

    CREATE UNIQUE NONCLUSTERED INDEX IX_audit_TestView_BusinessKey ON audit.Test (CompanyId, CustomerId);
    --CREATE UNIQUE NONCLUSTERED INDEX IX_audit_TestView_AlternateKey ON audit.Test ();
END;
GO

CREATE OR ALTER PROCEDURE audit.usp_Merge_Test
AS
BEGIN
    SET NOCOUNT ON;

    MERGE INTO audit.Test AS TGT
    USING audit.TestView AS SRC ON (
         SRC.CompanyId = TGT.CompanyId AND SRC.CustomerId = TGT.CustomerId 
    )

    WHEN MATCHED AND TGT.[ChangeHashKey] <> SRC.[ChangeHashKey] THEN
        UPDATE SET TGT.ChangeHashKey = SRC.ChangeHashKey, TGT.UpdateDatetime = SRC.UpdateDatetime, TGT.IsDeleted = SRC.IsDeleted, 
        TGT.CustomerDescription = SRC.CustomerDescription, TGT.VATNumber = SRC.VATNumber

    WHEN NOT MATCHED BY TARGET THEN
        INSERT (CompanyId, CustomerId, HistoricalHashKey, ChangeHashKey, InsertDatetime, UpdateDatetime, IsDeleted, CustomerDescription, VATNumber)
        VALUES (CompanyId, CustomerId, HistoricalHashKey, ChangeHashKey, InsertDatetime, UpdateDatetime, IsDeleted, CustomerDescription, VATNumber)

    WHEN NOT MATCHED BY SOURCE AND TGT.IsDeleted = CAST(0 AS BIT) THEN
        UPDATE SET TGT.IsDeleted = CAST(1 AS BIT)
    
    OUTPUT
        CURRENT_TIMESTAMP AS merge_datetime,
        CASE WHEN Inserted.IsDeleted = CAST(1 AS BIT) THEN N'DELETE' ELSE $action END AS merge_action,
        'audit.Test' AS full_olap_table_name,
        'CompanyId = ' + CAST(COALESCE(inserted.CompanyId, deleted.CompanyId) AS NVARCHAR)+ 'CustomerId = ' + CAST(COALESCE(inserted.CustomerId, deleted.CustomerId) AS NVARCHAR) AS primary_key_description
    INTO audit.merge_log_details;

END
GO

--EXEC audit.usp_Merge_Test;
GO
