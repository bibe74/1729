
CREATE PROCEDURE setup.usp_CreateOleDBCommand
(
	@schema_name		sysname,
	@table_name			sysname,
	@primary_key_fields	NVARCHAR(1000) = N''
) AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @full_extract_table_name sysname;
	DECLARE @extract_olap_table_name sysname;

	--SELECT * FROM sys.tables T INNER JOIN sys.schemas S ON S.schema_id = T.schema_id AND S.name = @schema_name WHERE T.name = @table_name;

	SELECT
		@full_extract_table_name = full_table_name,
		@extract_olap_table_name = olap_schema_name + SUBSTRING(full_table_name, CHARINDEX('.', full_table_name), LEN(full_table_name)) + '_' + olap_table_name
	FROM setup.tables_AX2009
	WHERE SUBSTRING(@table_name, 3, LEN(@table_name)) = olap_table_name;

	--SELECT @full_extract_table_name, @extract_olap_table_name;

	IF (@full_extract_table_name IS NULL)
	BEGIN
		PRINT 'Original table not found. Exiting';
		RETURN;
	END;

	DECLARE @PrimaryKey NVARCHAR(130) = N'';
	DECLARE @BusinessKey NVARCHAR(1000) = N'';
	DECLARE @sep1 NVARCHAR(10) = N'';

	SELECT
		@PrimaryKey = @PrimaryKey + CASE WHEN C.column_id = 10 THEN C.column_olap_name ELSE N'' END,
		@BusinessKey = @BusinessKey + CASE WHEN C.column_id < 10 OR (C.column_id = 10 AND T.use_recid_in_primary_key = 1) THEN @sep1 + C.column_olap_name ELSE N'' END,
		@sep1 = CASE WHEN @BusinessKey <> N'' THEN N', ' ELSE N'' END

	FROM setup.tables_AX2009 T
	INNER JOIN setup.columns_AX2009 C ON C.full_table_name = T.full_table_name AND C.is_olap_column = 1
	WHERE T.full_table_name = @full_extract_table_name
	ORDER BY C.column_id;

	DECLARE @lengthtypes NVARCHAR(150) = N'char,nchar,varchar,nvarchar,';
	DECLARE @precscaletypes NVARCHAR(150) = N'numeric,';

	SELECT 
		N'@' + C.name + N' ' + UPPER(TYPE_NAME(C.user_type_id)) + CASE
		  WHEN CHARINDEX(TYPE_NAME(C.user_type_id) + ',', @lengthtypes) > 0 THEN '(' + CONVERT(NVARCHAR, CONVERT(INT, C.max_length)) + ')'
		  WHEN CHARINDEX(TYPE_NAME(C.user_type_id) + ',', @precscaletypes) > 0 THEN '(' + RTRIM(CASE WHEN CHARINDEX(TYPE_NAME(C.system_type_id) + ',', @precscaletypes) > 0 THEN CONVERT(CHAR(5),COLUMNPROPERTY(C.object_id, C.name, 'precision')) ELSE '     ' END) + ', ' + RTRIM(CASE WHEN CHARINDEX(TYPE_NAME(C.system_type_id) + ',', @precscaletypes) > 0 THEN CONVERT(CHAR(5),ODBCSCALE(C.system_type_id, scale)) ELSE '     ' END) + ')'
		  ELSE ''
		END

	FROM sys.tables T
	INNER JOIN sys.schemas S ON S.schema_id = T.schema_id AND S.name = @schema_name
	INNER JOIN sys.columns C ON C.object_id = T.object_id
	LEFT JOIN setup.tables_AX2009 TAX ON T.name = 'T_' + TAX.olap_table_name
	LEFT JOIN setup.columns_AX2009 CAX ON CAX.full_table_name = TAX.full_table_name AND CAX.column_olap_name = C.name
	WHERE T.name = @table_name
	ORDER BY CASE WHEN C.name = @PrimaryKey THEN 0 ELSE 1 END, C.column_id;

	DECLARE @Variables NVARCHAR(1000) = N'';
	DECLARE @Variables2 NVARCHAR(1000) = N'';
	DECLARE @sep2 NVARCHAR(10) = N'';
	DECLARE @Assignments NVARCHAR(1000) = N'';
	DECLARE @sep3 NVARCHAR(10) = N'';

	SELECT 
		@Variables = @Variables + @sep2 + N'@' + C.name + N' ' + UPPER(TYPE_NAME(C.user_type_id)) + CASE
		  WHEN CHARINDEX(TYPE_NAME(C.user_type_id) + ',', @lengthtypes) > 0 THEN '(' + CONVERT(NVARCHAR, CONVERT(INT, C.max_length)) + ')'
		  WHEN CHARINDEX(TYPE_NAME(C.user_type_id) + ',', @precscaletypes) > 0 THEN '(' + RTRIM(CASE WHEN CHARINDEX(TYPE_NAME(C.system_type_id) + ',', @precscaletypes) > 0 THEN CONVERT(CHAR(5),COLUMNPROPERTY(C.object_id, C.name, 'precision')) ELSE '     ' END) + ', ' + RTRIM(CASE WHEN CHARINDEX(TYPE_NAME(C.system_type_id) + ',', @precscaletypes) > 0 THEN CONVERT(CHAR(5),ODBCSCALE(C.system_type_id, scale)) ELSE '     ' END) + ')'
		  ELSE ''
		END,
		@Variables2 = @Variables2 + @sep2 + N'?',
		@sep2 = N', ',
		@Assignments = @Assignments + @sep3 + CASE WHEN C.name <> @PrimaryKey THEN @sep3 + C.name + N' = @' + C.name ELSE N'' END,
		@sep3 = CASE WHEN @Assignments <> N'' THEN N', ' ELSE N'' END

	FROM sys.tables T
	INNER JOIN sys.schemas S ON S.schema_id = T.schema_id AND S.name = @schema_name
	INNER JOIN sys.columns C ON C.object_id = T.object_id
	LEFT JOIN setup.tables_AX2009 TAX ON T.name = 'T_' + TAX.olap_table_name
	LEFT JOIN setup.columns_AX2009 CAX ON CAX.full_table_name = TAX.full_table_name AND CAX.column_olap_name = C.name
	WHERE T.name = @table_name
	ORDER BY CASE WHEN C.name = @PrimaryKey THEN 0 ELSE 1 END, C.column_id;

	SELECT @PrimaryKey PrimaryKey,
		@BusinessKey BusinessKey,
		@Variables Variables,
		@Assignments Assignments;
		
	SELECT CONVERT(NVARCHAR(1000), N'') AS sqlstatement
	UNION ALL SELECT N'IF OBJECT_ID(N''' + @schema_name + N'.usp_Update_' + @table_name + N''', N''P'') IS NULL EXEC (''CREATE PROCEDURE ' + @schema_name + N'.usp_Update_' + @table_name + N' AS RETURN 0;'');'
	UNION ALL SELECT N'GO'
	UNION ALL SELECT N''
	UNION ALL SELECT N'ALTER PROCEDURE ' + @schema_name + N'.usp_Update_' + @table_name
	UNION ALL SELECT N'(' + @Variables + N')'
	UNION ALL SELECT N'AS'
	UNION ALL SELECT N'BEGIN'
	UNION ALL SELECT N'SET NOCOUNT ON;'
	UNION ALL SELECT N''
	UNION ALL SELECT N'UPDATE ' + @schema_name + N'.' + @table_name
	UNION ALL SELECT N'SET ' + @Assignments
	UNION ALL SELECT N'WHERE PKGruppoVendite = @PKGruppoVendite;'
	UNION ALL SELECT N''
	UNION ALL SELECT N'END;'
	UNION ALL SELECT N'GO'
	UNION ALL SELECT N''
	UNION ALL SELECT N'--EXEC ' + @schema_name + N'.usp_Update_' + @table_name + N' ' + @Variables2 + N';'
	UNION ALL SELECT N''

END;
GO

