
CREATE PROCEDURE setup.usp_Create_setup_all_columns_MES40_RAW
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID('setup.all_columns_MES40_RAW', 'U') IS NOT NULL DROP TABLE setup.all_columns_MES40_RAW;

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

INTO setup.all_columns_MES40_RAW

FROM [SQL2014\SCADA2014].master.dbo.all_columns_MES40_RAW;

ALTER TABLE setup.all_columns_MES40_RAW ADD CONSTRAINT PK_setup_all_columns_MES40_RAW PRIMARY KEY CLUSTERED (schema_name, table_name, column_id);

END;
GO

