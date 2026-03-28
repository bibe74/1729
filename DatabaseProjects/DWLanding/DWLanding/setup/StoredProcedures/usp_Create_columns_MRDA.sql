
CREATE PROCEDURE setup.usp_Create_columns_MRDA
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID(N'setup.columns_MRDA', N'U') IS NOT NULL DROP TABLE setup.columns_MRDA;

CREATE TABLE setup.columns_MRDA (
	-- Chiavi
	full_table_name			NVARCHAR(261) NOT NULL REFERENCES setup.tables_MRDA(full_table_name),
	column_id				INT NOT NULL, -- 1-9: primary key; 10: OLAP primary key; 11-100: attributes; 101-: values

	-- Attributi
	column_real_id			INT NOT NULL,
	column_name				NVARCHAR(128) NOT NULL,
	column_full_type		NVARCHAR(128) NOT NULL,
	is_olap_column			BIT CONSTRAINT DFT_setup_columns_MRDA_is_olap_column DEFAULT (0) NOT NULL,
	column_olap_name		NVARCHAR(128) NOT NULL,
	column_olap_enumname	NVARCHAR(128) CONSTRAINT DFT_setup_columns_MRDA_column_olap_enumname DEFAULT (N'') NOT NULL,
	column_type				NVARCHAR(128) NULL,
	column_length			INT NULL,
	column_precision		VARCHAR(5) NULL,
	column_scale			VARCHAR(5) NULL,
	is_nullable				BIT CONSTRAINT DFT_setup_columns_MRDA_is_nullable DEFAULT (0) NOT NULL,

	CONSTRAINT PK_setup_columns_MRDA PRIMARY KEY CLUSTERED (full_table_name, column_id)
);

CREATE UNIQUE NONCLUSTERED INDEX IX_setup_columns_MRDA_column_name ON setup.columns_MRDA (full_table_name, column_name);

END;
GO

