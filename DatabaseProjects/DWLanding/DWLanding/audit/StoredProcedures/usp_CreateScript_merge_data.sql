CREATE   PROCEDURE audit.usp_CreateScript_merge_data
(
	@schema_name NVARCHAR(128)
)
AS
BEGIN

    SET NOCOUNT ON;

    --DECLARE @tab CHAR(1) = CHAR(9);

    SELECT CAST(N'/**' AS NVARCHAR(1000)) AS statement_line
    UNION ALL SELECT N' * @stored_procedure audit.usp_merge_data_from_' + @schema_name
    UNION ALL SELECT N' * @description Script per caricamento tabelle OLAP - schema ' + @schema_name
    UNION ALL SELECT N'*/'
    UNION ALL SELECT N''
    UNION ALL SELECT N'CREATE OR ALTER PROCEDURE audit.usp_merge_data_from_' + @schema_name
    UNION ALL SELECT N'AS'
    UNION ALL SELECT N'BEGIN'
    UNION ALL SELECT N''
    UNION ALL SELECT N'SET NOCOUNT ON;'
    UNION ALL SELECT N''
    UNION ALL SELECT N'DECLARE @PKEventSubElaboration BIGINT;'
    UNION ALL SELECT N''
    UNION ALL SELECT N'EXEC audit.usp_LogEvent N''audit.usp_merge_data_from_' + @schema_name + N': Inizio'', @PKEventSubElaboration;'
    UNION ALL SELECT N''
    UNION ALL SELECT N'EXEC ' + S.name + N'.' + P.name + N';'
        FROM sys.procedures P
        INNER JOIN sys.schemas S ON S.schema_id = P.schema_id
            AND S.name = @schema_name
        WHERE P.name LIKE N'usp_Merge%'
    UNION ALL SELECT N''
    UNION ALL SELECT N'EXEC audit.usp_LogEvent N''audit.usp_merge_data_from_' + @schema_name + N': Fine'', @PKEventSubElaboration;'
    UNION ALL SELECT N''
    UNION ALL SELECT N'END;'
    UNION ALL SELECT N'GO'
    UNION ALL SELECT N'';

END;
GO

