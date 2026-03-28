
/**
 * @view setup.all_columns
 * @description Definizione dei campi OLAP del provider AX2009

*/

CREATE   VIEW setup.all_columns
AS
/*
	column_id 1-9: colonne della chiave primaria
	column_id 10: RECID (se non fa parte della chiave primaria)
	column_id 11-1000: colonne delle dimensioni
	column_id 1001-...: colonne delle misure
*/
WITH AllColumns
AS (
	SELECT
		CAST(N'AX2009' AS NVARCHAR(128)) AS schema_name,
		C.*,
		T.use_recid_in_primary_key,
		T.olap_table_alias
	FROM setup.columns_AX2009 C
	INNER JOIN setup.tables_AX2009 T ON C.full_table_name = T.full_table_name AND T.is_olap_table = 1
	WHERE C.is_olap_column = 1

	UNION ALL

	SELECT
		N'EDMSRV64',
		C.*,
		T.use_recid_in_primary_key,
		T.olap_table_alias
	FROM setup.columns_EDMSRV64 C
	INNER JOIN setup.tables_EDMSRV64 T ON C.full_table_name = T.full_table_name AND T.is_olap_table = 1
	WHERE C.is_olap_column = 1

	UNION ALL

	SELECT
		N'IMETPQ',
		C.*,
		T.use_recid_in_primary_key,
		T.olap_table_alias
	FROM setup.columns_IMETPQ C
	INNER JOIN setup.tables_IMETPQ T ON C.full_table_name = T.full_table_name AND T.is_olap_table = 1
	WHERE C.is_olap_column = 1

	UNION ALL

	SELECT
		N'IRDP',
		C.*,
		T.use_recid_in_primary_key,
		T.olap_table_alias
	FROM setup.columns_IRDP C
	INNER JOIN setup.tables_IRDP T ON C.full_table_name = T.full_table_name AND T.is_olap_table = 1
	WHERE C.is_olap_column = 1

	UNION ALL

	SELECT
		N'MERIDIANSQL',
		C.*,
		T.use_recid_in_primary_key,
		T.olap_table_alias
	FROM setup.columns_MERIDIANSQL C
	INNER JOIN setup.tables_MERIDIANSQL T ON C.full_table_name = T.full_table_name AND T.is_olap_table = 1
	WHERE C.is_olap_column = 1

	UNION ALL

	SELECT
		N'METRADTE',
		C.*,
		T.use_recid_in_primary_key,
		T.olap_table_alias
	FROM setup.columns_METRADTE C
	INNER JOIN setup.tables_METRADTE T ON C.full_table_name = T.full_table_name AND T.is_olap_table = 1
	WHERE C.is_olap_column = 1

	UNION ALL

	SELECT
		N'METRAPQ',
		C.*,
		T.use_recid_in_primary_key,
		T.olap_table_alias
	FROM setup.columns_METRAPQ C
	INNER JOIN setup.tables_METRAPQ T ON C.full_table_name = T.full_table_name AND T.is_olap_table = 1
	WHERE C.is_olap_column = 1

	UNION ALL

	SELECT
		N'MRDA',
		C.*,
		T.use_recid_in_primary_key,
		T.olap_table_alias
	FROM setup.columns_MRDA C
	INNER JOIN setup.tables_MRDA T ON C.full_table_name = T.full_table_name AND T.is_olap_table = 1
	WHERE C.is_olap_column = 1

	UNION ALL

	SELECT
		N'MRDP',
		C.*,
		T.use_recid_in_primary_key,
		T.olap_table_alias
	FROM setup.columns_MRDP C
	INNER JOIN setup.tables_MRDP T ON C.full_table_name = T.full_table_name AND T.is_olap_table = 1
	WHERE C.is_olap_column = 1

	UNION ALL

	SELECT
		N'RAGUSAPQ',
		C.*,
		T.use_recid_in_primary_key,
		T.olap_table_alias
	FROM setup.columns_RAGUSAPQ C
	INNER JOIN setup.tables_RAGUSAPQ T ON C.full_table_name = T.full_table_name AND T.is_olap_table = 1
	WHERE C.is_olap_column = 1

	UNION ALL

	SELECT
		N'STATISTICHE',
		C.*,
		T.use_recid_in_primary_key,
		T.olap_table_alias
	FROM setup.columns_STATISTICHE C
	INNER JOIN setup.tables_STATISTICHE T ON C.full_table_name = T.full_table_name AND T.is_olap_table = 1
	WHERE C.is_olap_column = 1

	UNION ALL

	SELECT
		N'MES40MALU',
		C.*,
		T.use_recid_in_primary_key,
		T.olap_table_alias
	FROM setup.columns_MES40_RDP C
	INNER JOIN setup.tables_MES40_RDP T ON C.full_table_name = T.full_table_name AND T.is_olap_table = 1
	WHERE C.is_olap_column = 1

	UNION ALL

	SELECT
		N'AXBETA',
		C.*,
		T.use_recid_in_primary_key,
		T.olap_table_alias
	FROM setup.columns_AXBETA C
	INNER JOIN setup.tables_AXBETA T ON C.full_table_name = T.full_table_name AND T.is_olap_table = 1
	WHERE C.is_olap_column = 1

	UNION ALL

	SELECT
		N'MSE',
		C.*,
		T.use_recid_in_primary_key,
		T.olap_table_alias
	FROM setup.columns_MetraSegnalazioniEdilizia C
	INNER JOIN setup.tables_MetraSegnalazioniEdilizia T ON C.full_table_name = T.full_table_name AND T.is_olap_table = 1
	WHERE C.is_olap_column = 1

	UNION ALL

	SELECT
		N'MES40RAW',
		C.*,
		T.use_recid_in_primary_key,
		T.olap_table_alias
	FROM setup.columns_MES40_RAW C
	INNER JOIN setup.tables_MES40_RAW T ON C.full_table_name = T.full_table_name AND T.is_olap_table = 1
	WHERE C.is_olap_column = 1
)
SELECT
	AC.schema_name,
	AC.full_table_name,
	AC.column_id,
	AC.column_name,
	AC.column_full_type,
	AC.is_nullable,
	AC.column_olap_name,
	AC.column_olap_enumname,
	AC.olap_table_alias,
	CASE WHEN AC.column_id <= L.last_key_column_id THEN 1 ELSE 0 END AS is_primary_key,
	CASE WHEN AC.column_id = 10 THEN 1 ELSE 0 END AS is_surrogate_key,
	CASE WHEN AC.column_id > 10 AND AC.column_id <= 1000 THEN 1 ELSE 0 END AS is_dimension,
	CASE WHEN AC.column_id > 1000 THEN 1 ELSE 0 END AS is_measure,
	CASE WHEN AC.column_id = L.last_key_column_id THEN 1 ELSE 0 END AS is_last_key,
	CASE WHEN AC.column_id = L.last_field_column_id THEN 1 ELSE 0 END AS is_last_field

FROM AllColumns AC
INNER JOIN (
	SELECT
		schema_name,
		full_table_name,
		MAX(CASE WHEN column_id < 10 OR (use_recid_in_primary_key = 1 AND column_id = 10) THEN column_id ELSE NULL END) AS last_key_column_id,
		MAX(column_id) AS last_field_column_id,
		olap_table_alias

	FROM AllColumns
	GROUP BY
		schema_name,
		full_table_name,
		olap_table_alias
) L ON AC.schema_name = L.schema_name AND AC.full_table_name = L.full_table_name
GO

