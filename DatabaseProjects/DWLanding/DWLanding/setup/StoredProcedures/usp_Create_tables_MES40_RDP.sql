
CREATE PROCEDURE setup.usp_Create_tables_MES40_RDP
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID(N'setup.tables_MES40_RDP', N'U') IS NOT NULL DROP TABLE setup.tables_MES40_RDP;

CREATE TABLE setup.tables_MES40_RDP (
	-- Chiavi
	full_table_name				NVARCHAR(261) NOT NULL CONSTRAINT PK_setup_tables_MES40_RDP PRIMARY KEY CLUSTERED,

	-- Attributi
	is_olap_table				BIT CONSTRAINT DFT_setup_tables_MES40_RDP_is_olap_table DEFAULT (0) NOT NULL,
	olap_schema_name			NVARCHAR(128) NOT NULL,
	olap_table_name				NVARCHAR(128) NOT NULL,
	use_recid_in_primary_key	BIT CONSTRAINT DFT_setup_tables_MES40_RDP_use_RECID_in_primary_key DEFAULT(0) NOT NULL,
	olap_table_alias			NVARCHAR(10) CONSTRAINT DFT_setup_tables_MES40_RDP_olap_table_alias DEFAULT(N'T') NOT NULL
);

END;
GO

