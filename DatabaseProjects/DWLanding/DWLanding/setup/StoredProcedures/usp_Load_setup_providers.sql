CREATE PROCEDURE setup.usp_Load_setup_providers
AS
BEGIN

SET NOCOUNT ON;

IF OBJECT_ID('setup.providers', 'U') IS NULL
BEGIN
	EXEC setup.usp_Create_setup_providers;
END;

MERGE INTO setup.providers AS TGT
USING (
	SELECT
		N'AX2009' AS schema_name,
		N'AX 2009' AS provider_name,
		N'[AXSQL\AX2009]' AS database_server,
		N'AX2009_METRA_LIVE' AS database_name,
		N'setup.tables_AX2009' AS tables_full_table_name,
		N'setup.columns_AX2009' AS columns_full_table_name
	
	UNION ALL SELECT N'IMETPQ', N'MetraPQ (Imet)', N'[SQL2012IMET\DB2012]', N'MetraPQ', N'setup.tables_IMETPQ', N'setup.columns_IMETPQ'
	UNION ALL SELECT N'IRDP', N'Raccolta dati produzione (Imet)', N'[SQL2012IMET\SCADA2012]', N'Metra_RaccoltaDatiProduzione', N'setup.tables_IRDP', N'setup.columns_IRDP'
	----UNION ALL SELECT N'MERIDIAN', N'Meridian', N'[SQL2014\DB2014]', N'BCDL_EDMSRV64_MetraProgettazione', N'setup.tables_MERIDIAN', N'setup.columns_MERIDIAN'
	UNION ALL SELECT N'MERIDIAN', N'Meridian', N'EDMSRV2016', N'BCRepository', N'setup.tables_MERIDIAN', N'setup.columns_MERIDIAN'
	UNION ALL SELECT N'MERIDIANSQL', N'MeridianSQL', N'[SQL2014\DB2014]', N'MeridianSQL', N'setup.tables_MERIDIANSQL', N'setup.columns_MERIDIANSQL'
	UNION ALL SELECT N'METRAPQ', N'MetraPQ (Metra)', N'[SQL2014\DB2014]', N'MetraPQ', N'setup.tables_METRAPQ', N'setup.columns_METRAPQ'
	UNION ALL SELECT N'MRDA', N'Raccolta dati assemblaggio (Metra)', N'[SQL2014\SCADA2014]', N'RaccoltaDatiAssemblaggio', N'setup.tables_MRDA', N'setup.columns_MRDA'
	UNION ALL SELECT N'MRDP', N'Raccolta dati produzione (Metra)', N'[SQL2014\SCADA2014]', N'RaccoltaDatiProduzione', N'setup.tables_MRDP', N'setup.columns_MRDP'
	UNION ALL SELECT N'RAGUSAPQ', N'MetraPQ (Metra Ragusa)', N'[SQL2014MRAG\DB2014]', N'MetraPQ', N'setup.tables_RAGUSAPQ', N'setup.columns_RAGUSAPQ'
	UNION ALL SELECT N'RRDP', N'Raccolta dati produzione (Metra Ragusa)', N'[SQL2014MRAG\SCADA2014]', N'Metra_RaccoltaDatiProduzione', N'setup.tables_RRDP', N'setup.columns_RRDP'
	UNION ALL SELECT N'STATISTICHE', N'Vecchio server BI (STATISTICHE)', N'STATISTICHE', N'OLAP_Metra', N'setup.tables_STATISTICHE', N'setup.columns_STATISTICHE'
	UNION ALL SELECT N'METRADTE', N'Metra DTE', N'[SQL2014\DB2014]', N'wwwMetraIt', N'setup.tables_wwwMetraIt', N'setup.columns_wwwMetraIt'
	UNION ALL SELECT N'MES40MALU', N'MES40_RDP (Metra Aluminium)', N'[192.168.216.247\SCADA2017]', N'MES40_RDP', N'setup.tables_MES40_RDP', N'setup.columns_MES40_RDP'
	UNION ALL SELECT N'AXBETA', N'AXBETA', N'[AXBETA\AXBETA]', N'AX2009_METRA_BETA', N'setup.tables_AXBETA', N'setup.columns_AXBETA'
    UNION ALL SELECT N'MSE', N'Metra Segnalazioni Edilizia', N'[SQL2014\DB2014]', N'MetraSegnalazioniEdilizia', N'setup.tables_MetraSegnalazioniEdilizia', N'setup.columns_MetraSegnalazioniEdilizia'
	UNION ALL SELECT N'MES40RAW', N'Raccolta dati MES40 (Metra)', N'[SQL2014\SCADA2014]', N'MES40_RAW', N'setup.tables_MES40RAW', N'setup.columns_MES40RAW'
) AS SRC
ON SRC.schema_name = TGT.schema_name
WHEN MATCHED
	AND (
		TGT.provider_name <> SRC.provider_name
		OR TGT.database_server <> SRC.database_server
		OR TGT.database_name <> SRC.database_name
		OR TGT.tables_full_table_name <> SRC.tables_full_table_name
		OR TGT.columns_full_table_name <> SRC.columns_full_table_name
	)
	THEN UPDATE
	SET TGT.provider_name = SRC.provider_name,
		TGT.database_server = SRC.database_server,
		TGT.database_name = SRC.database_name,
		TGT.tables_full_table_name = SRC.tables_full_table_name,
		TGT.columns_full_table_name = SRC.columns_full_table_name
WHEN NOT MATCHED THEN INSERT VALUES (schema_name, provider_name, database_server, database_name, tables_full_table_name, columns_full_table_name)
WHEN NOT MATCHED BY SOURCE THEN DELETE;

END;
GO

