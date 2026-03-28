
CREATE PROCEDURE setup.usp_Create_setup_all_columns_BCDL_EDMSRV64_MetraProgettazione2017
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID(N'setup.all_columns_BCDL_EDMSRV64_MetraProgettazione2017', N'U') IS NOT NULL DROP TABLE setup.all_columns_BCDL_EDMSRV64_MetraProgettazione2017;

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

INTO setup.all_columns_BCDL_EDMSRV64_MetraProgettazione2017

FROM EDMSRV64.master.dbo.all_columns_BCDL_EDMSRV64_MetraProgettazione2017;

ALTER TABLE setup.all_columns_BCDL_EDMSRV64_MetraProgettazione2017 ADD CONSTRAINT PK_setup_all_columns_BCDL_EDMSRV64_MetraProgettazione2017 PRIMARY KEY CLUSTERED (schema_name, table_name, column_id);

END;
GO

