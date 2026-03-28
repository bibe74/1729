
CREATE PROCEDURE setup.usp_Create_setup_all_columns_BlueCieloEdmTestMetraProgettazioneDataLibrary
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID(N'setup.all_columns_BlueCieloEdmTestMetraProgettazioneDataLibrary', N'U') IS NOT NULL DROP TABLE setup.all_columns_BlueCieloEdmTestMetraProgettazioneDataLibrary;

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

INTO setup.all_columns_BlueCieloEdmTestMetraProgettazioneDataLibrary

FROM [SQL2005\DB2005].master.dbo.all_columns_BlueCieloEdmTestMetraProgettazioneDataLibrary;

ALTER TABLE setup.all_columns_BlueCieloEdmTestMetraProgettazioneDataLibrary ADD CONSTRAINT PK_setup_all_columns_BlueCieloEdmTestMetraProgettazioneDataLibrary PRIMARY KEY CLUSTERED (schema_name, table_name, column_id);

END;
GO

