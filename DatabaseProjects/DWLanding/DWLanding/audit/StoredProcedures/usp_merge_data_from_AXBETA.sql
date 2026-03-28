
/**
 * @stored_procedure audit.usp_merge_data_from_AXBETA
 * @description Script per caricamento tabelle OLAP - schema AXBETA
*/

CREATE   PROCEDURE audit.usp_merge_data_from_AXBETA
AS
BEGIN

SET NOCOUNT ON;

DECLARE @PKEventSubElaboration BIGINT;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_AXBETA: Inizio', @PKEventSubElaboration;

EXEC AXBETA.usp_Merge_NPOCRMCONFIRMEDITEM_ArticoliConfermati;
EXEC AXBETA.usp_Merge_NPOCRMPROJBUSREL_Soggetto;
EXEC AXBETA.usp_Merge_NPOCRMPROPOSALITEM_ArticoliProposti;
EXEC AXBETA.usp_Merge_PROJTABLE_Targa;
EXEC AXBETA.usp_Merge_SMMBUSRELTABLE_RelazioneCommerciale;
EXEC AXBETA.usp_Merge_SRSANALYSISENUMS_Etichetta;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_AXBETA: Fine', @PKEventSubElaboration;

END;
GO

