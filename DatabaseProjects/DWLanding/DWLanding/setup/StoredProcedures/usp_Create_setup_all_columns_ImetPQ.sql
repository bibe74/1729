
CREATE PROCEDURE setup.usp_Create_setup_all_columns_ImetPQ
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID(N'setup.all_columns_ImetPQ', N'U') IS NOT NULL DROP TABLE setup.all_columns_ImetPQ;

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

INTO setup.all_columns_ImetPQ

FROM [SQL2014\DB2014].master.dbo.all_columns_MetraPQ;

ALTER TABLE setup.all_columns_ImetPQ ADD CONSTRAINT PK_setup_all_columns_ImetPQ PRIMARY KEY CLUSTERED (schema_name, table_name, column_id);

END;
GO

