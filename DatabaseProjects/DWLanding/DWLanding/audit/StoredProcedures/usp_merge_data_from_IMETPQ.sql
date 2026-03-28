
/**
 * @stored_procedure audit.usp_merge_data_from_IMETPQ
 * @description Script per caricamento tabelle OLAP - schema IMETPQ
*/

CREATE   PROCEDURE audit.usp_merge_data_from_IMETPQ
AS
BEGIN

SET NOCOUNT ON;

DECLARE @PKEventSubElaboration BIGINT;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_IMETPQ: Inizio', @PKEventSubElaboration;

EXEC IMETPQ.usp_Merge_FogliodiproduzionegiornalieraFoall_DatiColata;
EXEC IMETPQ.usp_Merge_statoavanzamento_DatiMatrice;
EXEC IMETPQ.usp_Merge_tblFoallFornitoriBillette_FornitoreBillette;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_IMETPQ: Fine', @PKEventSubElaboration;

END;
GO

