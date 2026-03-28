
CREATE PROCEDURE setup.usp_Create_setup_all_columns_Metra_RaccoltaDatiProduzione
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID(N'setup.all_columns_Metra_RaccoltaDatiProduzione', N'U') IS NOT NULL DROP TABLE setup.all_columns_Metra_RaccoltaDatiProduzione;

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

INTO setup.all_columns_Metra_RaccoltaDatiProduzione

FROM [SQL2012IMET\SCADA2012].master.dbo.all_columns_Metra_RaccoltaDatiProduzione;

ALTER TABLE setup.all_columns_Metra_RaccoltaDatiProduzione ADD CONSTRAINT PK_setup_all_columns_Metra_RaccoltaDatiProduzione PRIMARY KEY CLUSTERED (schema_name, table_name, column_id);

END;
GO

