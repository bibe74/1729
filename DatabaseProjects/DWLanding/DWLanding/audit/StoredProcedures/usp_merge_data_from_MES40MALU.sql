
/**
 * @stored_procedure audit.usp_merge_data_from_MES40MALU
 * @description Script per caricamento tabelle OLAP - schema MES40MALU
*/

CREATE   PROCEDURE audit.usp_merge_data_from_MES40MALU
AS
BEGIN

SET NOCOUNT ON;

DECLARE @PKEventSubElaboration BIGINT;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_MES40MALU: Inizio', @PKEventSubElaboration;

EXEC MES40MALU.usp_Merge_Batch_Lotti;
EXEC MES40MALU.usp_Merge_BatchBillet_Billette;
EXEC MES40MALU.usp_Merge_BatchDieChanges_CambiMatrice;
EXEC MES40MALU.usp_Merge_BatchDowntime_FermiMacchina;
EXEC MES40MALU.usp_Merge_BatchProdOrders_LottiOrdini;
EXEC MES40MALU.usp_Merge_BatchScrapShear_ScartiCesoia;
EXEC MES40MALU.usp_Merge_Press_Pressa;
EXEC MES40MALU.usp_Merge_PressBatchClosingReason_CausaleChiusuraLotto;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_MES40MALU: Fine', @PKEventSubElaboration;

END;
GO

