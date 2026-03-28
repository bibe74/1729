
CREATE PROCEDURE setup.usp_Load_tables_MERIDIANSQL
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID(N'setup.tables_MERIDIANSQL', N'U') IS NULL
BEGIN
	EXEC setup.usp_Create_tables_MERIDIANSQL;
END;

MERGE INTO setup.tables_MERIDIANSQL AS TGT
USING (
	SELECT DISTINCT
		schema_name + N'.' + table_name AS full_table_name,
		0 AS is_olap_table,
		N'MERIDIANSQL' AS olap_schema_name,
		N'' AS olap_table_name,
		0 AS use_recid_in_primary_key,
		N'T' AS olap_table_alias

	FROM setup.all_columns_MeridianSQL
) AS SRC
ON SRC.full_table_name = TGT.full_table_name
WHEN NOT MATCHED THEN INSERT VALUES (full_table_name, is_olap_table, olap_schema_name, olap_table_name, use_recid_in_primary_key, olap_table_alias)
WHEN NOT MATCHED BY SOURCE THEN DELETE;

END;
GO

