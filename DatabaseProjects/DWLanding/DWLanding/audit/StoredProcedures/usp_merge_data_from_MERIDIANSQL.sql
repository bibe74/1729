
/**
 * @stored_procedure audit.usp_merge_data_from_MERIDIANSQL
 * @description Script per caricamento tabelle OLAP - schema MERIDIANSQL
*/

CREATE   PROCEDURE audit.usp_merge_data_from_MERIDIANSQL
AS
BEGIN

SET NOCOUNT ON;

DECLARE @PKEventSubElaboration BIGINT;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_MERIDIANSQL: Inizio', @PKEventSubElaboration;

EXEC MERIDIANSQL.usp_Merge_MetraProgettazione_Accessori_OfferteFornitori_OfferteAccessori;
EXEC MERIDIANSQL.usp_Merge_MetraProgettazione_Accessori_Progetti_ProgettoAccessori;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_MERIDIANSQL: Fine', @PKEventSubElaboration;

END;
GO

