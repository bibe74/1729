
CREATE PROCEDURE setup.usp_Create_setup_all_columns_AXBETA
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID(N'setup.all_columns_AXBETA', N'U') IS NOT NULL DROP TABLE setup.all_columns_AXBETA;

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

INTO setup.all_columns_AXBETA

FROM [AXBETA\AXBETA].master.dbo.all_columns_AXBETA;

ALTER TABLE setup.all_columns_AXBETA ADD CONSTRAINT PK_setup_all_columns_AXBETA PRIMARY KEY CLUSTERED (schema_name, table_name, column_id);

END;
GO

