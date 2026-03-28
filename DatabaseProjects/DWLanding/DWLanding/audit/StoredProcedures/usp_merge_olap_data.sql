CREATE   PROCEDURE audit.usp_merge_olap_data
AS
BEGIN
SET NOCOUNT ON;

EXEC audit.usp_compact_merge_log;

EXEC audit.usp_merge_data_from_AX2009;
EXEC audit.usp_merge_data_from_AXBETA;
EXEC audit.usp_merge_data_from_CANADAPQ;
EXEC audit.usp_merge_data_from_EDMSRV2016;
EXEC audit.usp_merge_data_from_IMETPQ;
EXEC audit.usp_merge_data_from_IRDP;
EXEC audit.usp_merge_data_from_MERIDIANSQL;
EXEC audit.usp_merge_data_from_MES40IMET;
EXEC audit.usp_merge_data_from_MES40MALU;
EXEC audit.usp_merge_data_from_METRADTE;
EXEC audit.usp_merge_data_from_METRAPQ;
EXEC audit.usp_merge_data_from_MRDA;
EXEC audit.usp_merge_data_from_MRDP;
EXEC audit.usp_merge_data_from_RAGUSAPQ;
EXEC audit.usp_merge_data_from_RRDP;

SELECT *
FROM audit.merge_logView (nolock)
ORDER BY merge_datetime DESC,
	full_olap_table_name;

END;
GO

