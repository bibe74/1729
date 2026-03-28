
CREATE PROCEDURE setup.usp_CreateTableScript_SyncMetra
(
	@schema_name NVARCHAR(128),
	@full_table_name NVARCHAR(261),
	@show_script BIT = 0
)
AS
BEGIN

--DECLARE @schema_name NVARCHAR(128) = N'AX2009';
--DECLARE @full_table_name NVARCHAR(261) = N'dbo.INVENTTABLE';
--DECLARE @show_script BIT = 0;

SET NOCOUNT ON;

DECLARE @fully_qualified_table_name NVARCHAR(400);
DECLARE @olap_table_name NVARCHAR(128);
DECLARE @olap_table_name_stripped NVARCHAR(128);
DECLARE @full_olap_table_name NVARCHAR(261);
--DECLARE @full_olap_table_name_stripped NVARCHAR(128);
DECLARE @full_staging_table_name NVARCHAR(261);
DECLARE @olap_table_alias NVARCHAR(10);
DECLARE @tab CHAR(4) = '    ';
DECLARE @sql_primary_key_description NVARCHAR(4000) = N'';
DECLARE @sql_join_clause NVARCHAR(4000) = N'';
DECLARE @sql_inequality NVARCHAR(4000) = N'';
DECLARE @sql_update_clause NVARCHAR(4000) = N'';
DECLARE @sql_table_fields NVARCHAR(4000) = N'';
DECLARE @sep_dash NVARCHAR(4000) = N' + '' - '' + ';
DECLARE @sep_AND NVARCHAR(4000) = N' AND ';
DECLARE @sep_OR NVARCHAR(4000) = N' OR ';
DECLARE @sep_comma NVARCHAR(4000) = N', ';

SELECT @fully_qualified_table_name = database_server + '.' + database_name + '.' + @full_table_name
FROM setup.providers
WHERE schema_name = @schema_name;

IF @fully_qualified_table_name IS NULL RETURN;

SELECT @olap_table_name = SUBSTRING(full_table_name, CHARINDEX('.', full_table_name) + 1, LEN(full_table_name)) + '_' + olap_table_name,
	@full_olap_table_name = @schema_name + SUBSTRING(full_table_name, CHARINDEX('.', full_table_name), LEN(full_table_name)) + '_' + olap_table_name,
	@full_staging_table_name = N'staging.T_' + olap_table_name,
	@olap_table_alias = olap_table_alias
FROM setup.all_tables
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name;

IF @full_olap_table_name IS NULL RETURN;

SELECT @olap_table_name_stripped = REPLACE(REPLACE(REPLACE(@olap_table_name, N'[', N''), N' ', N''), N']', N''),
	@full_olap_table_name = REPLACE(REPLACE(REPLACE(@full_olap_table_name, N'[', N''), N' ', N''), N']', N'');

--IF OBJECT_ID(N'#statement_lines', N'U') IS NOT NULL DROP TABLE #statement_lines;
BEGIN TRY
	DROP TABLE #statement_lines;
END TRY
BEGIN CATCH
	--print 'Ciao';
END CATCH;

CREATE TABLE #statement_lines (
	line_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	statement_group NVARCHAR(20) NULL,
	statement_line NVARCHAR(4000) NOT NULL
);

INSERT INTO #statement_lines (statement_line)
SELECT N'/**'
UNION ALL SELECT N' * @table ' + @full_olap_table_name
UNION ALL SELECT N' * @description '
UNION ALL SELECT N''
UNION ALL SELECT N' * @depends ' + @full_table_name
UNION ALL SELECT N''
UNION ALL SELECT N'SELECT TOP 1 * FROM ' + @fully_qualified_table_name
UNION ALL SELECT N'*/'
UNION ALL SELECT N''
;
UPDATE #statement_lines SET statement_group = N'intro' WHERE statement_group IS NULL;

INSERT INTO #statement_lines (statement_line)
SELECT N'/**'
UNION ALL SELECT N' * @table ' + @full_staging_table_name
UNION ALL SELECT N' * @description '
UNION ALL SELECT N''
UNION ALL SELECT N' * @depends ' + @full_olap_table_name
UNION ALL SELECT N''
UNION ALL SELECT N'SELECT TOP 1 * FROM ' + @full_olap_table_name
UNION ALL SELECT N'*/'
UNION ALL SELECT N''
;
UPDATE #statement_lines SET statement_group = N'staging_intro' WHERE statement_group IS NULL;

INSERT INTO #statement_lines (statement_line)
SELECT N'IF OBJECT_ID(N''' + @full_olap_table_name + N'View'', N''V'') IS NULL EXEC(''CREATE VIEW ' + @full_olap_table_name + N'View AS SELECT 1 AS fld;'');'
UNION ALL SELECT N'GO'
UNION ALL SELECT N''
;

INSERT INTO #statement_lines (statement_line)
SELECT N'ALTER VIEW ' + @full_olap_table_name + N'View'

UNION ALL SELECT N'AS'
UNION ALL SELECT N'SELECT'

UNION ALL SELECT @tab + N'-- Chiavi'
UNION ALL
SELECT @tab + column_name + N',' + @tab + @tab + '-- ' + column_olap_name + CASE WHEN column_olap_enumname <> N'' THEN N' [enum ' + column_olap_enumname + N']' ELSE N'' END
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND (
		is_primary_key = 1
		OR is_surrogate_key = 1
	)

UNION ALL SELECT N''
UNION ALL SELECT TOP 1 @tab + N'-- Dimensioni'
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND is_dimension = 1
UNION ALL
SELECT @tab + column_name + CASE WHEN is_last_field = 1 THEN N'' ELSE N',' END + @tab + @tab + '-- ' + column_olap_name + CASE WHEN column_olap_enumname <> N'' THEN N' [enum ' + column_olap_enumname + N']' ELSE N'' END
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND is_dimension = 1
UNION ALL SELECT TOP 1 + N''
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND is_dimension = 1

UNION ALL SELECT TOP 1 @tab + N'-- Misure'
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND is_measure = 1
UNION ALL
SELECT @tab + column_name + CASE WHEN is_last_field = 1 THEN N'' ELSE N',' END + @tab + @tab + '-- ' + column_olap_name + CASE WHEN column_olap_enumname <> N'' THEN N' [enum ' + column_olap_enumname + N']' ELSE N'' END
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND is_measure = 1
UNION ALL SELECT TOP 1 + N''
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND is_measure = 1

UNION ALL SELECT N'FROM ' + @fully_qualified_table_name + N';'
UNION ALL SELECT N'GO'
UNION ALL SELECT N''
;

UPDATE #statement_lines SET statement_group = N'view' WHERE statement_group IS NULL;

INSERT INTO #statement_lines (statement_line)
SELECT N'IF OBJECT_ID(N''' + @full_staging_table_name + N'View'', N''V'') IS NULL EXEC(''CREATE VIEW ' + @full_staging_table_name + N'View AS SELECT 1 AS fld;'');'
UNION ALL SELECT N'GO'
UNION ALL SELECT N''
;
INSERT INTO #statement_lines (statement_line)
SELECT N'ALTER VIEW ' + @full_staging_table_name + N'View'

UNION ALL SELECT N'AS'
UNION ALL SELECT N'SELECT'
UNION ALL SELECT @tab + N'-- Chiavi'
UNION ALL SELECT @tab + @olap_table_alias + N'.PKAzienda,'
UNION ALL SELECT @tab + @olap_table_alias + N'.IDAzienda,'
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND column_olap_name = N'IDAzienda'

UNION ALL
SELECT @tab + olap_table_alias + N'.' + column_olap_name + N','
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND (
		is_primary_key = 1
		OR is_surrogate_key = 1
	)
	AND column_olap_name <> N'IDAzienda'

UNION ALL SELECT N''
UNION ALL SELECT @tab + N'CONVERT(VARBINARY(20), HASHBYTES(''MD5'', CONCAT('
UNION ALL SELECT @tab + @tab + @olap_table_alias + N'.PKAzienda,'
UNION ALL SELECT @tab + @tab + @olap_table_alias + N'.IDAzienda,'
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND column_olap_name = N'IDAzienda'

UNION ALL
SELECT @tab + @tab + olap_table_alias + N'.' + column_olap_name + N','
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND (
		is_primary_key = 1
		OR is_surrogate_key = 1
	)
	AND column_olap_name <> N'IDAzienda'
UNION ALL SELECT @tab + @tab + N''' '''
UNION ALL SELECT @tab + N'))) AS HistoricalHashKey,'
UNION ALL SELECT @tab + N'CONVERT(VARBINARY(20), HASHBYTES(''MD5'', CONCAT('
UNION ALL
SELECT @tab + @tab + olap_table_alias + N'.' + column_olap_name + N','
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND is_dimension = 1
UNION ALL
SELECT @tab + @tab + olap_table_alias + N'.' + column_olap_name + N','
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND is_measure = 1
UNION ALL SELECT @tab + @tab + N''' '''
UNION ALL SELECT @tab + N'))) AS ChangeHashKey,'

UNION ALL SELECT N''
UNION ALL SELECT @tab + N'-- Dimensioni'
UNION ALL
SELECT @tab + olap_table_alias + N'.' + column_olap_name + CASE WHEN is_last_field = 1 THEN N'' ELSE N',' END
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND is_dimension = 1

UNION ALL SELECT N''
UNION ALL SELECT TOP 1 @tab + N'-- Misure'
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND is_measure = 1
UNION ALL
SELECT @tab + olap_table_alias + N'.' + column_olap_name + CASE WHEN is_last_field = 1 THEN N'' ELSE N',' END
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND is_measure = 1

UNION ALL SELECT N'FROM ('

UNION ALL SELECT @tab + N'SELECT'
UNION ALL SELECT @tab + @tab + N'AZ.PKAzienda,'
UNION ALL SELECT @tab + @tab + N'AZ.IDAzienda,'
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND column_olap_name = N'IDAzienda'

UNION ALL
SELECT @tab + @tab + olap_table_alias + N'.' + column_name + N' AS ' + column_olap_name + N','
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND (
		is_primary_key = 1
		OR is_surrogate_key = 1
	)
	AND column_olap_name <> N'IDAzienda'

UNION ALL
SELECT @tab + @tab + olap_table_alias + N'.' + column_name + N' AS ' + column_olap_name + CASE WHEN is_last_field = 1 THEN N'' ELSE N',' END
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND is_dimension = 1

UNION ALL
SELECT @tab + @tab + olap_table_alias + N'.' + column_name + N' AS ' + column_olap_name + CASE WHEN is_last_field = 1 THEN N'' ELSE N',' END
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND is_measure = 1

UNION ALL SELECT N''
UNION ALL SELECT @tab + N'FROM DWLanding.' + @full_olap_table_name + N' ' + @olap_table_alias +  N''
UNION ALL SELECT @tab + N'INNER JOIN staging.Azienda AZ ON ' + @olap_table_alias + N'.' + column_name + N' = AZ.IDAzienda'
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND column_olap_name = N'IDAzienda'

UNION ALL SELECT N') ' + @olap_table_alias + N';'
UNION ALL SELECT N'GO'
UNION ALL SELECT N''
UNION ALL SELECT N'--DROP TABLE ' + @full_staging_table_name + N';'
UNION ALL SELECT N'GO'
UNION ALL SELECT N''
UNION ALL SELECT N'IF OBJECT_ID(N''' + @full_staging_table_name + N''', N''U'') IS NULL'
UNION ALL SELECT N'BEGIN'
UNION ALL SELECT @tab + N'SELECT TOP 0 * INTO ' + @full_staging_table_name + N' FROM ' + @full_staging_table_name + N'View;'
UNION ALL SELECT N''
UNION ALL SELECT @tab + N'ALTER TABLE ' + @full_staging_table_name + N' ADD CONSTRAINT PK_' + REPLACE(@full_staging_table_name, N'.', N'_') + N' PRIMARY KEY CLUSTERED (surrogate_key);'
UNION ALL SELECT N''
UNION ALL SELECT @tab + N'ALTER TABLE ' + @full_staging_table_name + N' ALTER COLUMN nullable_column BIGINT NOT NULL;'
UNION ALL SELECT N''
UNION ALL SELECT @tab + N'CREATE UNIQUE NONCLUSTERED INDEX PK_' + REPLACE(@full_staging_table_name, N'.', N'_') + N'_ ON ' + @full_staging_table_name + N' (business_key);'
UNION ALL SELECT N'END;'
UNION ALL SELECT N'GO'
UNION ALL SELECT N''
UNION ALL SELECT N'EXEC audit.usp_reload_table N''' + REPLACE(@full_staging_table_name, N'.', N''', N''') + N''', @PKEventSubElaboration = NULL;'
UNION ALL SELECT N'GO'
UNION ALL SELECT N''
;

UPDATE #statement_lines SET statement_group = N'staging_view_stub' WHERE statement_group IS NULL;

INSERT INTO #statement_lines (statement_line)
SELECT N'IF OBJECT_ID(N''' + @schema_name + N'.usp_Create_' + @olap_table_name_stripped + N''', N''P'') IS NULL EXEC (''CREATE PROCEDURE ' + @schema_name + N'.usp_Create_' + @olap_table_name_stripped + N' AS RETURN 0;'');'
UNION ALL SELECT N'GO'
UNION ALL SELECT N''
;

INSERT INTO #statement_lines (statement_line)
SELECT N'ALTER PROCEDURE ' + @schema_name + N'.usp_Create_' + @olap_table_name_stripped
UNION ALL SELECT N'AS'
UNION ALL SELECT N'BEGIN'
UNION ALL SELECT N'SET NOCOUNT ON;'
UNION ALL SELECT N''
--UNION ALL SELECT N'IF OBJECT_ID(N''' + @full_olap_table_name + N''', N''U'') IS NOT NULL DROP TABLE ' + @full_olap_table_name + N';'
--UNION ALL SELECT N''
UNION ALL SELECT N'CREATE TABLE ' + @full_olap_table_name + N' ('

UNION ALL SELECT @tab + N'-- Chiavi'
UNION ALL
SELECT @tab + column_name + @tab + @tab + column_full_type + CASE WHEN is_nullable = 0 THEN N' NOT NULL' ELSE '' END + N','
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND (
		is_primary_key = 1
		OR is_surrogate_key = 1
	)

UNION ALL SELECT N''
UNION ALL SELECT @tab + N'-- Dimensioni'
UNION ALL
SELECT @tab + column_name + @tab + @tab + column_full_type + CASE WHEN is_nullable = 0 THEN N' NOT NULL' ELSE '' END + CASE WHEN is_last_field = 1 THEN N'' ELSE N',' END
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND is_dimension = 1

UNION ALL SELECT N''
UNION ALL SELECT TOP 1 @tab + N'-- Misure'
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND is_measure = 1
UNION ALL
SELECT @tab + column_name + @tab + @tab + column_full_type + CASE WHEN is_nullable = 0 THEN N' NOT NULL' ELSE '' END + CASE WHEN is_last_field = 1 THEN N'' ELSE N',' END
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND is_measure = 1

UNION ALL SELECT N''
UNION ALL SELECT @tab + N'-- Constraint'
UNION ALL SELECT @tab + N'CONSTRAINT PK_' + @olap_table_name_stripped + ' PRIMARY KEY CLUSTERED ('
UNION ALL
SELECT @tab + @tab + column_name + CASE WHEN is_last_key = 1 THEN N'' ELSE N',' END
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND is_primary_key = 1
UNION ALL SELECT @tab + N')'
UNION ALL SELECT N');'
UNION ALL SELECT N''
UNION ALL SELECT N'END;'
UNION ALL SELECT N'GO'
UNION ALL SELECT N''
;

UPDATE #statement_lines SET statement_group = N'usp_Create' WHERE statement_group IS NULL;

INSERT INTO #statement_lines (statement_line)
SELECT N'IF OBJECT_ID(N''' + @schema_name + N'.usp_AddIndexes_' + @olap_table_name_stripped + N''', N''P'') IS NULL EXEC(''CREATE PROCEDURE ' + @schema_name + N'.usp_AddIndexes_' + @olap_table_name_stripped + N' AS RETURN 0;'');'
UNION ALL SELECT N'GO'
UNION ALL SELECT N''
;

INSERT INTO #statement_lines (statement_line)
SELECT N'ALTER PROCEDURE ' + @schema_name + N'.usp_AddIndexes_' + @olap_table_name_stripped
UNION ALL SELECT N'AS'
UNION ALL SELECT N'BEGIN'
UNION ALL SELECT N'SET NOCOUNT ON;'
UNION ALL SELECT N''
UNION ALL SELECT N'--CREATE NONCLUSTERED INDEX IX_' + @schema_name + N'_' + @olap_table_name + N'_ ON ' + @schema_name + N'.' + @olap_table_name + N' () INCLUDE();'
UNION ALL SELECT N''
UNION ALL SELECT N'END;'
UNION ALL SELECT N'GO'
UNION ALL SELECT N''
;
UPDATE #statement_lines SET statement_group = N'usp_AddIndexes' WHERE statement_group IS NULL;

SELECT
	@sql_primary_key_description = @sql_primary_key_description + N'''' + column_name + N' = '' + CAST(COALESCE(inserted.' + column_name + N', deleted.' + column_name + N') AS NVARCHAR)' + @sep_dash
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND is_primary_key = 1;

SELECT
	@sql_join_clause = @sql_join_clause + N'SRC.' + C.column_name + N' = TGT.' + C.column_name + @sep_AND
FROM setup.all_columns_SyncMetra C
INNER JOIN setup.all_tables T ON C.schema_name = T.schema_name AND C.full_table_name = T.full_table_name
WHERE C.schema_name = @schema_name
	AND C.full_table_name = @full_table_name
	AND (
		C.is_primary_key = 1
		OR (T.use_recid_in_primary_key = 1 AND C.is_surrogate_key = 1)
	);

SELECT
	@sql_inequality = @sql_inequality + N'TGT.' + column_name + N' <> SRC.' + column_name + @sep_OR,
	@sql_update_clause = @sql_update_clause + N'TGT.' + column_name + N' = SRC.' + column_name + @sep_comma
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name
	AND is_primary_key = 0
	AND is_surrogate_key = 0;

SELECT
	@sql_table_fields = @sql_table_fields + column_name + @sep_comma
FROM setup.all_columns_SyncMetra
WHERE schema_name = @schema_name
	AND full_table_name = @full_table_name;

IF CHARINDEX(@sep_dash, @sql_primary_key_description) > 0 SELECT @sql_primary_key_description = LEFT(@sql_primary_key_description, LEN(@sql_primary_key_description) - LEN(@sep_dash));
IF CHARINDEX(@sep_AND, @sql_join_clause) > 0 SELECT @sql_join_clause = LEFT(@sql_join_clause, LEN(@sql_join_clause) - LEN(@sep_AND));
IF CHARINDEX(@sep_OR, @sql_inequality) > 0 SELECT @sql_inequality = LEFT(@sql_inequality, LEN(@sql_inequality) - LEN(@sep_OR));
IF CHARINDEX(@sep_comma, @sql_update_clause) > 0 SELECT @sql_update_clause = LEFT(@sql_update_clause, LEN(@sql_update_clause) - LEN(@sep_comma));
IF CHARINDEX(@sep_comma, @sql_table_fields) > 0 SELECT @sql_table_fields = LEFT(@sql_table_fields, LEN(@sql_table_fields) - LEN(@sep_comma));

INSERT INTO #statement_lines (statement_line)
SELECT N'IF OBJECT_ID(N''' + @schema_name + N'.usp_Merge_' + @olap_table_name_stripped + N''', N''P'') IS NULL EXEC(''CREATE PROCEDURE ' + @schema_name + N'.usp_Merge_' + @olap_table_name_stripped + N' AS RETURN 0;'');'
UNION ALL SELECT N'GO'
UNION ALL SELECT N''
;

INSERT INTO #statement_lines (statement_line)
SELECT N'ALTER PROCEDURE ' + @schema_name + N'.usp_Merge_' + @olap_table_name_stripped
UNION ALL SELECT N'AS'
UNION ALL SELECT N'BEGIN'
UNION ALL SELECT N'SET NOCOUNT ON;'
UNION ALL SELECT N''
UNION ALL SELECT N'IF OBJECT_ID(N''' + @full_olap_table_name + ''', N''U'') IS NULL'
UNION ALL SELECT N'BEGIN'
UNION ALL SELECT @tab + N'EXEC ' + @schema_name + N'.usp_Create_' + @olap_table_name_stripped + N';'
UNION ALL SELECT @tab + N'EXEC ' + @schema_name + N'.usp_AddIndexes_' + @olap_table_name_stripped + N';'
UNION ALL SELECT N'END;'
UNION ALL SELECT N''
UNION ALL SELECT N'MERGE INTO ' + @full_olap_table_name + N' AS TGT'
UNION ALL SELECT N'USING ' + @full_olap_table_name + N'View (nolock) AS SRC'
UNION ALL SELECT N'ON ' + @sql_join_clause
UNION ALL SELECT N'WHEN MATCHED AND (' + @sql_inequality + N')'
UNION ALL SELECT N'  THEN UPDATE SET ' + @sql_update_clause
UNION ALL SELECT N'WHEN NOT MATCHED'
UNION ALL SELECT N'  THEN INSERT VALUES (' + @sql_table_fields + N')'
UNION ALL SELECT N'WHEN NOT MATCHED BY SOURCE'
UNION ALL SELECT N'  THEN DELETE'
UNION ALL SELECT N'OUTPUT'
UNION ALL SELECT @tab + N'CURRENT_TIMESTAMP AS merge_datetime,'
UNION ALL SELECT @tab + N'$action AS merge_action,'
UNION ALL SELECT @tab + N'''' + @full_olap_table_name + N''' AS full_olap_table_name,'
UNION ALL SELECT @tab + @sql_primary_key_description + N' AS primary_key_description'
UNION ALL SELECT N'INTO audit.merge_log_details;'
UNION ALL SELECT N''
UNION ALL SELECT N'END;'
UNION ALL SELECT N'GO'
UNION ALL SELECT N''
;
UPDATE #statement_lines SET statement_group = N'usp_Merge' WHERE statement_group IS NULL;

INSERT INTO #statement_lines (statement_line)
SELECT N'--EXEC audit.usp_ReloadTableSelectInto ''' + @full_olap_table_name + N''';'
UNION ALL SELECT N'--EXEC audit.usp_ReloadTable ''' + @full_olap_table_name + N''';'
UNION ALL SELECT N'--EXEC ' + @schema_name + N'.usp_Merge_' + @olap_table_name_stripped + N';'
UNION ALL SELECT N'GO'
UNION ALL SELECT N''
;
UPDATE #statement_lines SET statement_group = N'usp_ReloadTable' WHERE statement_group IS NULL;

DELETE FROM setup.olap_script WHERE schema_name = @schema_name AND full_olap_table_name = @full_olap_table_name;

INSERT INTO setup.olap_script (schema_name, full_olap_table_name, line_id, statement_group, statement_line)
SELECT @schema_name, @full_olap_table_name, line_id, statement_group, statement_line
FROM #statement_lines
ORDER BY line_id;

IF (@show_script = 1)
BEGIN
	--SELECT *
	--FROM setup.olap_script
	--WHERE schema_name = @schema_name
	--	AND full_olap_table_name = @full_olap_table_name
	--ORDER BY line_id;

	SELECT statement_line
	FROM setup.olap_script
	WHERE schema_name = @schema_name
		AND full_olap_table_name = @full_olap_table_name
		AND statement_group IN (N'intro', N'view')
	--ORDER BY full_olap_table_name,
	--	line_id;
	UNION ALL SELECT N'';

	SELECT statement_line
	FROM setup.olap_script
	WHERE schema_name = @schema_name
		AND full_olap_table_name = @full_olap_table_name
		AND statement_group IN (N'intro', N'usp_Create', N'usp_AddIndexes')
	--ORDER BY full_olap_table_name,
	--	line_id;
	UNION ALL SELECT N'';

	SELECT statement_line
	FROM setup.olap_script
	WHERE schema_name = @schema_name
		AND full_olap_table_name = @full_olap_table_name
		AND statement_group IN (N'intro', N'usp_Merge', N'usp_ReloadTable')
	--ORDER BY full_olap_table_name,
	--	line_id;
	UNION ALL SELECT N'';

	SELECT statement_line
	FROM setup.olap_script
	WHERE schema_name = @schema_name
		AND full_olap_table_name = @full_olap_table_name
		AND statement_group IN (N'staging_intro', N'staging_view_stub')
	--ORDER BY full_olap_table_name,
	--	line_id;
	UNION ALL SELECT N'';
END;
END;
GO

