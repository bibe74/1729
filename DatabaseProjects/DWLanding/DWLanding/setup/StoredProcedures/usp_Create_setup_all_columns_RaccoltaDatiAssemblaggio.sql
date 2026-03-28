
CREATE PROCEDURE setup.usp_Create_setup_all_columns_RaccoltaDatiAssemblaggio
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID(N'setup.all_columns_RaccoltaDatiAssemblaggio', N'U') IS NOT NULL DROP TABLE setup.all_columns_RaccoltaDatiAssemblaggio;

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

INTO setup.all_columns_RaccoltaDatiAssemblaggio

FROM [SQL2014\SCADA2014].master.dbo.all_columns_RaccoltaDatiAssemblaggio;

ALTER TABLE setup.all_columns_RaccoltaDatiAssemblaggio ADD CONSTRAINT PK_setup_all_columns_RaccoltaDatiAssemblaggio PRIMARY KEY CLUSTERED (schema_name, table_name, column_id);

END;
GO

