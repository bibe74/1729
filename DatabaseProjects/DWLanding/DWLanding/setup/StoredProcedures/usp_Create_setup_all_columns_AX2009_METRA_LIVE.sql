
CREATE PROCEDURE setup.usp_Create_setup_all_columns_AX2009_METRA_LIVE
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID('setup.all_columns_AX2009_METRA_LIVE', 'U') IS NOT NULL DROP TABLE setup.all_columns_AX2009_METRA_LIVE;

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

INTO setup.all_columns_AX2009_METRA_LIVE

FROM [AXSQL\AX2009].master.dbo.all_columns_AX2009_METRA_LIVE;

ALTER TABLE setup.all_columns_AX2009_METRA_LIVE ADD CONSTRAINT PK_setup_all_columns_AX2009_METRA_LIVE PRIMARY KEY CLUSTERED (schema_name, table_name, column_id);

END;
GO

