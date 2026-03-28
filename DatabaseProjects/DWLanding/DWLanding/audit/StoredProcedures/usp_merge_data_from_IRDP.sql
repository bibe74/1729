
/**
 * @stored_procedure audit.usp_merge_data_from_IRDP
 * @description Script per caricamento tabelle OLAP - schema IRDP
*/

CREATE   PROCEDURE audit.usp_merge_data_from_IRDP
AS
BEGIN

SET NOCOUNT ON;

DECLARE @PKEventSubElaboration BIGINT;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_IRDP: Inizio', @PKEventSubElaboration;

EXEC IRDP.usp_Merge_CausaliChiusuraLotto_CausaleChiusuraLotto;
EXEC IRDP.usp_Merge_FermiMacchina_FermiMacchina;
EXEC IRDP.usp_Merge_Presse_Pressa;
EXEC IRDP.usp_Merge_RaccoltaDatiLotto_Billette;
EXEC IRDP.usp_Merge_RaccoltaDatiLotto_Lotti_Lotti;
EXEC IRDP.usp_Merge_RaccoltaDatiTaglierina_DatiIncestamento;
EXEC IRDP.usp_Merge_ScartiCesoia_ScartiCesoia;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_IRDP: Fine', @PKEventSubElaboration;

END;
GO

