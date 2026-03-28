
CREATE PROCEDURE setup.usp_CreateOlapTableScriptFromView
(
	@schema_name SYSNAME,
	@table_name SYSNAME,
	@pk_last_column_id INT = 1,
	@show_script BIT = 0
)
AS
BEGIN

--DECLARE @schema_name SYSNAME = N'staging';
--DECLARE @table_name SYSNAME = N'T_Cliente';
--DECLARE @show_script BIT = 1;

SET NOCOUNT ON;

DECLARE @full_view_name SYSNAME;
DECLARE @full_table_name SYSNAME;
DECLARE @message VARCHAR(MAX);
DECLARE @sql_statement NVARCHAR(MAX);
DECLARE @precscaletypes NVARCHAR(150) = N',tinyint,smallint,decimal,int,bigint,real,money,float,numeric,smallmoney,date,time,datetime2,datetimeoffset,';
DECLARE @nchartypes NVARCHAR(150) = N',nchar,nvarchar,ntext,';

SELECT @full_view_name = @schema_name + '.' + @table_name + 'View';
SELECT @full_table_name = @schema_name + '.' + @table_name;

IF OBJECT_ID(@full_view_name, 'V') IS NULL
BEGIN
	SET @message = 'Missing view (' + @full_view_name + '). Aborting';
	RAISERROR(@message, 10, 1);
	RETURN;
END; 

IF OBJECT_ID('dbo.__tfv', 'U') IS NOT NULL DROP TABLE dbo.__tfv;

SET @sql_statement = N'SELECT TOP 0 * INTO __tfv FROM ' + @full_view_name;
EXEC sys.sp_executesql @sql_statement;

--SELECT * FROM dbo.__tfv;

SELECT
	AC.column_id,
	AC.name AS column_name,
	CASE WHEN AC.column_id <= @pk_last_column_id THEN 1 ELSE 0 END AS isPrimaryKey,
	TYPE_NAME(AC.user_type_id) AS column_type,
	CONVERT(INT, AC.max_length) / CASE WHEN CHARINDEX(',' + TYPE_NAME(AC.system_type_id) + ',', @nchartypes) > 0 THEN 2 ELSE 1 END AS column_length,
	CASE WHEN CHARINDEX(TYPE_NAME(AC.system_type_id) + ',', @precscaletypes) > 0 THEN CONVERT(CHAR(5),COLUMNPROPERTY(AC.object_id, AC.name, 'precision')) ELSE '     ' END AS column_precision,
	CASE WHEN CHARINDEX(TYPE_NAME(AC.system_type_id) + ',', @precscaletypes) > 0 THEN CONVERT(CHAR(5),ODBCSCALE(AC.system_type_id, scale)) ELSE '     ' END AS column_scale,
	AC.is_nullable

FROM sys.all_columns AC
INNER JOIN sys.objects O ON AC.object_id = O.OBJECT_ID AND O.NAME = N'__tfv'
WHERE O.type = N'U'
ORDER BY
	AC.column_id;

--IF OBJECT_ID('dbo.__tfv', 'U') IS NOT NULL DROP TABLE dbo.__tfv;

END
GO

