
CREATE PROCEDURE setup.usp_Load_tables_MES40_RAW
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID('setup.tables_MES40_RAW', 'U') IS NULL
BEGIN
	EXEC setup.usp_Create_tables_MES40_RAW;
END;

MERGE INTO setup.tables_MES40_RAW AS TGT
USING (
	SELECT DISTINCT
		schema_name + N'.' + table_name AS full_table_name,
		0 AS is_olap_table,
		N'MES40_RAW' AS olap_schema_name,
		N'' AS olap_table_name,
		0 AS use_recid_in_primary_key,
		N'T' AS olap_table_alias

	FROM setup.all_columns_MES40_RAW
) AS SRC
ON SRC.full_table_name = TGT.full_table_name
WHEN NOT MATCHED THEN INSERT VALUES (full_table_name, is_olap_table, olap_schema_name, olap_table_name, use_recid_in_primary_key, olap_table_alias)
OUTPUT $action, Inserted.*;
--WHEN NOT MATCHED BY SOURCE THEN DELETE;

END;
GO

