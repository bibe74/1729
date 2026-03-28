
CREATE PROCEDURE setup.usp_Create_setup_all_columns_MeridianSQL
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID(N'setup.all_columns_MeridianSQL', N'U') IS NOT NULL DROP TABLE setup.all_columns_MeridianSQL;

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

INTO setup.all_columns_MeridianSQL

FROM [SQL2014\DB2014].master.dbo.all_columns_MeridianSQL;

ALTER TABLE setup.all_columns_MeridianSQL ADD CONSTRAINT PK_setup_all_columns_MeridianSQL PRIMARY KEY CLUSTERED (schema_name, table_name, column_id);

END;
GO

