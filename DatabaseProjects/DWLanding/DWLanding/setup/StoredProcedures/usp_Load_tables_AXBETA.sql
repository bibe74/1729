
CREATE PROCEDURE setup.usp_Load_tables_AXBETA
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID(N'setup.tables_AXBETA', N'U') IS NULL
BEGIN
	EXEC setup.usp_Create_tables_AXBETA;
END;

BEGIN TRAN

MERGE INTO setup.tables_AXBETA AS TGT
USING (
	SELECT DISTINCT
		schema_name + N'.' + table_name AS full_table_name,
		0 AS is_olap_table,
		N'AXBETA' AS olap_schema_name,
		N'' AS olap_table_name,
		0 AS use_recid_in_primary_key,
		N'T' AS olap_table_alias

	FROM setup.all_columns_AXBETA
) AS SRC
ON SRC.full_table_name = TGT.full_table_name
WHEN NOT MATCHED THEN INSERT VALUES (full_table_name, is_olap_table, olap_schema_name, olap_table_name, use_recid_in_primary_key, olap_table_alias)
--WHEN NOT MATCHED BY SOURCE THEN DELETE
OUTPUT Inserted.*;

COMMIT;

END;
GO

