CREATE   VIEW setup.all_tables
AS
SELECT
	CAST(N'AX2009' AS NVARCHAR(128)) AS schema_name,
	full_table_name,
	is_olap_table,
	olap_schema_name,
	olap_table_name,
	use_recid_in_primary_key,
	olap_table_alias

FROM setup.tables_AX2009

UNION ALL SELECT N'EDMSRV64', full_table_name, is_olap_table, olap_schema_name, olap_table_name, use_recid_in_primary_key, olap_table_alias FROM setup.tables_EDMSRV64
UNION ALL SELECT N'IMETPQ', full_table_name, is_olap_table, olap_schema_name, olap_table_name, use_recid_in_primary_key, olap_table_alias FROM setup.tables_IMETPQ
UNION ALL SELECT N'IRDP', full_table_name, is_olap_table, olap_schema_name, olap_table_name, use_recid_in_primary_key, olap_table_alias FROM setup.tables_IRDP
UNION ALL SELECT N'MERIDIANSQL', full_table_name, is_olap_table, olap_schema_name, olap_table_name, use_recid_in_primary_key, olap_table_alias FROM setup.tables_MERIDIANSQL
UNION ALL SELECT N'METRADTE', full_table_name, is_olap_table, olap_schema_name, olap_table_name, use_recid_in_primary_key, olap_table_alias FROM setup.tables_METRADTE
UNION ALL SELECT N'METRAPQ', full_table_name, is_olap_table, olap_schema_name, olap_table_name, use_recid_in_primary_key, olap_table_alias FROM setup.tables_METRAPQ
UNION ALL SELECT N'MRDA', full_table_name, is_olap_table, olap_schema_name, olap_table_name, use_recid_in_primary_key, olap_table_alias FROM setup.tables_MRDA
UNION ALL SELECT N'MRDP', full_table_name, is_olap_table, olap_schema_name, olap_table_name, use_recid_in_primary_key, olap_table_alias FROM setup.tables_MRDP
UNION ALL SELECT N'RAGUSAPQ', full_table_name, is_olap_table, olap_schema_name, olap_table_name, use_recid_in_primary_key, olap_table_alias FROM setup.tables_RAGUSAPQ
UNION ALL SELECT N'STATISTICHE', full_table_name, is_olap_table, olap_schema_name, olap_table_name, use_recid_in_primary_key, olap_table_alias FROM setup.tables_STATISTICHE
UNION ALL SELECT N'MES40MALU', full_table_name, is_olap_table, olap_schema_name, olap_table_name, use_recid_in_primary_key, olap_table_alias FROM setup.tables_MES40_RDP
UNION ALL SELECT N'AXBETA', full_table_name, is_olap_table, olap_schema_name, olap_table_name, use_recid_in_primary_key, olap_table_alias FROM setup.tables_AXBETA
UNION ALL SELECT N'MSE', full_table_name, is_olap_table, olap_schema_name, olap_table_name, use_recid_in_primary_key, olap_table_alias FROM setup.tables_MetraSegnalazioniEdilizia
UNION ALL SELECT N'MES40RAW', full_table_name, is_olap_table, olap_schema_name, olap_table_name, use_recid_in_primary_key, olap_table_alias FROM setup.tables_MES40_RAW;
GO

