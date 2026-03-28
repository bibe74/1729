
CREATE PROCEDURE setup.usp_Create_olap_script
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID(N'setup.olap_script', N'U') IS NOT NULL DROP TABLE setup.olap_script;

CREATE TABLE setup.olap_script (
	-- Chiavi
	--schema_name				NVARCHAR(128) NOT NULL REFERENCES setup.providers(schema_name),
	schema_name				NVARCHAR(128) NOT NULL, --REFERENCES setup.providers(schema_name),
	full_olap_table_name	NVARCHAR(261) NOT NULL,
	line_id					INT NOT NULL,

	-- Attributi
	statement_group			NVARCHAR(20) NOT NULL,
	statement_line			NVARCHAR(4000) NOT NULL,

	CONSTRAINT PK_setup_olap_script PRIMARY KEY CLUSTERED (schema_name, full_olap_table_name, line_id)
);

END;
GO

