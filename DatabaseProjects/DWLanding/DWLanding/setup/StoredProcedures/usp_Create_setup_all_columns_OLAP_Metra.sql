
CREATE PROCEDURE setup.usp_Create_setup_all_columns_OLAP_Metra
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID(N'setup.all_columns_OLAP_Metra', N'U') IS NOT NULL DROP TABLE setup.all_columns_OLAP_Metra;

SELECT
	schema_name,
	table_name,
	column_name,
	column_id,
	column_type,
	column_length,
	column_precision,
	column_scale,
	is_nullable

INTO setup.all_columns_OLAP_Metra

FROM STATISTICHE.master.dbo.all_columns_OLAP_Metra;

ALTER TABLE setup.all_columns_OLAP_Metra ADD CONSTRAINT PK_setup_all_columns_OLAP_Metra PRIMARY KEY CLUSTERED (schema_name, table_name, column_id);

END;
GO

