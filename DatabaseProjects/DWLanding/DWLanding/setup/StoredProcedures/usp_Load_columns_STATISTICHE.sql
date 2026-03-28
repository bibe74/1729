
CREATE PROCEDURE setup.usp_Load_columns_STATISTICHE
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID(N'setup.columns_STATISTICHE', N'U') IS NULL
BEGIN
	EXEC setup.usp_Create_columns_STATISTICHE;
END;

DECLARE @lengthtypes NVARCHAR(150) = N'char,nchar,varchar,nvarchar,';
--DECLARE @nlengthtypes NVARCHAR(150) = N'nchar,nvarchar,';
DECLARE @precscaletypes NVARCHAR(150) = N'numeric,';

MERGE INTO setup.columns_STATISTICHE AS TGT
USING (
	SELECT
		schema_name + '.' + table_name AS full_table_name,
		10 + column_id AS column_id,
		column_id AS column_real_id,
		column_name,
		UPPER(column_type) + CASE
		  WHEN CHARINDEX(column_type + ',', @lengthtypes) > 0 THEN '(' + CONVERT(NVARCHAR, column_length) + ')'
		  WHEN CHARINDEX(column_type + ',', @precscaletypes) > 0 THEN '(' + RTRIM(column_precision) + ', ' + RTRIM(column_scale) + ')'
		  ELSE ''
		END AS column_full_type,
		0 AS is_olap_column,
		column_name AS column_olap_name,
		N'' AS column_olap_enumname,
		column_type,
		column_length,
		column_precision,
		column_scale,
		is_nullable
	FROM setup.all_columns_OLAP_Metra
) AS SRC
ON SRC.full_table_name = TGT.full_table_name AND SRC.column_name = TGT.column_name
WHEN NOT MATCHED THEN INSERT VALUES (
	full_table_name,
	column_id,
	column_real_id,
	column_name,
	column_full_type,
	is_olap_column,
	column_olap_name,
	column_olap_enumname,
	column_type,
	column_length,
	column_precision,
	column_scale,
	is_nullable
)
--WHEN NOT MATCHED BY SOURCE THEN DELETE -- Non cancello mai i campi!
OUTPUT
	$action AS ChangeType,
	COALESCE(inserted.full_table_name, deleted.full_table_name) AS full_table_name,
	COALESCE(inserted.column_name, deleted.column_name) AS column_name;

UPDATE setup.columns_STATISTICHE
SET column_full_type = UPPER(column_type) + '(' + CONVERT(NVARCHAR, column_length / 2) + ')'
WHERE column_type IN (N'nchar', N'nvarchar');

UPDATE setup.columns_STATISTICHE
SET column_type = N'CHAR',
	column_length = 4,
	column_full_type = N'CHAR(4)'
WHERE (
	column_name = N'DATAAREAID'
	OR column_name LIKE N'%COMPANYID'
)
AND column_full_type = N'NVARCHAR(4)';

END;
GO

