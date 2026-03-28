
/**
 * @stored_procedure audit.usp_merge_data_from_RAGUSAPQ
 * @description Script per caricamento tabelle OLAP - schema RAGUSAPQ
*/

CREATE   PROCEDURE audit.usp_merge_data_from_RAGUSAPQ
AS
BEGIN

SET NOCOUNT ON;

DECLARE @PKEventSubElaboration BIGINT;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_RAGUSAPQ: Inizio', @PKEventSubElaboration;

EXEC RAGUSAPQ.usp_Merge_FogliodiproduzionegiornalieraFoall_DatiColata;
EXEC RAGUSAPQ.usp_Merge_statoavanzamento_DatiMatrice;
EXEC RAGUSAPQ.usp_Merge_tblFoallFornitoriBillette_FornitoreBillette;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_RAGUSAPQ: Fine', @PKEventSubElaboration;

END;
GO

