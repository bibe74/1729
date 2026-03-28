
/**
 * @stored_procedure audit.usp_merge_data_from_CANADAPQ
 * @description Script per caricamento tabelle OLAP - schema CANADAPQ
*/

CREATE   PROCEDURE audit.usp_merge_data_from_CANADAPQ
AS
BEGIN

SET NOCOUNT ON;

DECLARE @PKEventSubElaboration BIGINT;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_CANADAPQ: Inizio', @PKEventSubElaboration;

EXEC CANADAPQ.usp_Merge_FogliodiproduzionegiornalieraFoall_DatiColata;
EXEC CANADAPQ.usp_Merge_Leghediriferimento_Lega;
EXEC CANADAPQ.usp_Merge_statoavanzamento_DatiMatrice;
EXEC CANADAPQ.usp_Merge_tblFoallFornitoriBillette_FornitoreBillette;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_CANADAPQ: Fine', @PKEventSubElaboration;

END;
GO

