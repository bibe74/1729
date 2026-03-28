
CREATE PROCEDURE setup.usp_Create_setup_providers
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID(N'setup.providers', N'U') IS NOT NULL DROP TABLE setup.providers;

CREATE TABLE setup.providers (
	-- Chiavi
	schema_name					NVARCHAR(128) NOT NULL CONSTRAINT PK_setup_providers PRIMARY KEY CLUSTERED,

	-- Attributi
	provider_name				NVARCHAR(60) NOT NULL,
	database_server				NVARCHAR(128) NOT NULL,
	database_name				NVARCHAR(128) NOT NULL,
	tables_full_table_name		NVARCHAR(261) NOT NULL,
	columns_full_table_name		NVARCHAR(261) NOT NULL
);

END;
GO

