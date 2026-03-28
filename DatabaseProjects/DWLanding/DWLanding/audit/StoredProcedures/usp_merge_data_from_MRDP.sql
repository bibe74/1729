
/**
 * @stored_procedure audit.usp_merge_data_from_MRDP
 * @description Script per caricamento tabelle OLAP - schema MRDP
*/

CREATE   PROCEDURE audit.usp_merge_data_from_MRDP
AS
BEGIN

SET NOCOUNT ON;

DECLARE @PKEventSubElaboration BIGINT;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_MRDP: Inizio', @PKEventSubElaboration;

EXEC MRDP.usp_Merge_CaricamentoBillettePressa_Carico_CaricoBillette;
EXEC MRDP.usp_Merge_CaricamentoBillettePressa_MagazzinoMovimenti_MovimentiBillette;
EXEC MRDP.usp_Merge_CausaliChiusuraLotto_CausaleChiusuraLotto;
EXEC MRDP.usp_Merge_FermiMacchina_FermiMacchina;
EXEC MRDP.usp_Merge_Presse_Pressa;
EXEC MRDP.usp_Merge_RaccoltaDatiLotto_Billette;
EXEC MRDP.usp_Merge_RaccoltaDatiLotto_Billette_CalcoliBillette;
EXEC MRDP.usp_Merge_RaccoltaDatiLotto_CalcoliLotto_CalcoliLotto;
EXEC MRDP.usp_Merge_RaccoltaDatiLotto_Lotti_Lotti;
EXEC MRDP.usp_Merge_RaccoltaDatiLotto_Lotti_Ordini_LottiOrdini;
EXEC MRDP.usp_Merge_RaccoltaDatiTaglierina_DatiIncestamento;
EXEC MRDP.usp_Merge_ScartiCesoia_ScartiCesoia;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_MRDP: Fine', @PKEventSubElaboration;

END;
GO

