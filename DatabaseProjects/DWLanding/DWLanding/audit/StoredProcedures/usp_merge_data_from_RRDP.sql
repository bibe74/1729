
/**
 * @stored_procedure audit.usp_merge_data_from_RRDP
 * @description Script per caricamento tabelle OLAP - schema RRDP
*/

CREATE   PROCEDURE audit.usp_merge_data_from_RRDP
AS
BEGIN

SET NOCOUNT ON;

DECLARE @PKEventSubElaboration BIGINT;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_RRDP: Inizio', @PKEventSubElaboration;

EXEC RRDP.usp_Merge_CausaliChiusuraLotto_CausaleChiusuraLotto;
EXEC RRDP.usp_Merge_FermiMacchina_FermiMacchina;
EXEC RRDP.usp_Merge_Presse_Pressa;
EXEC RRDP.usp_Merge_RaccoltaDatiLotto_Billette;
EXEC RRDP.usp_Merge_RaccoltaDatiLotto_Billette_CalcoliBillette;
EXEC RRDP.usp_Merge_RaccoltaDatiLotto_Lotti_Lotti;
EXEC RRDP.usp_Merge_RaccoltaDatiLotto_Lotti_Ordini_LottiOrdini;
EXEC RRDP.usp_Merge_RaccoltaDatiTaglierina_DatiIncestamento;
EXEC RRDP.usp_Merge_ScartiCesoia_ScartiCesoia;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_RRDP: Fine', @PKEventSubElaboration;

END;
GO

