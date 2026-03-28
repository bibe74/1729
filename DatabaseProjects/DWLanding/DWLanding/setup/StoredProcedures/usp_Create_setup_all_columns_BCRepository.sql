
CREATE PROCEDURE setup.usp_Create_setup_all_columns_BCRepository
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID(N'setup.all_columns_BCRepository', N'U') IS NOT NULL DROP TABLE setup.all_columns_BCRepository;

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

INTO setup.all_columns_BCRepository

FROM EDMSRV2016.master.dbo.all_columns_BCRepository;

ALTER TABLE setup.all_columns_BCRepository ADD CONSTRAINT PK_setup_all_columns_BCRepository PRIMARY KEY CLUSTERED (schema_name, table_name, column_id);

END;
GO

