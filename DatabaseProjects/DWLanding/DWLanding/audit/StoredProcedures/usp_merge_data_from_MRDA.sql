
/**
 * @stored_procedure audit.usp_merge_data_from_MRDA
 * @description Script per caricamento tabelle OLAP - schema MRDA
*/

CREATE   PROCEDURE audit.usp_merge_data_from_MRDA
AS
BEGIN

SET NOCOUNT ON;

DECLARE @PKEventSubElaboration BIGINT;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_MRDA: Inizio', @PKEventSubElaboration;

EXEC MRDA.usp_Merge_Calendari_Calendario;
EXEC MRDA.usp_Merge_CausaliChiusura_CausaleChiusuraAssemblaggio;
EXEC MRDA.usp_Merge_CausaliFermo_CausaleFermoAssemblaggio;
EXEC MRDA.usp_Merge_CausaliProdRidotta_CausaleProduzioneRidotta;
EXEC MRDA.usp_Merge_FermiCalendario_FermiCalendario;
EXEC MRDA.usp_Merge_Lotti_LottiAssemblaggio;
EXEC MRDA.usp_Merge_LottiAttrezzaggi_LottiAssemblaggioAttrezzaggi;
EXEC MRDA.usp_Merge_LottiControlli_LottiAssemblaggioControlli;
EXEC MRDA.usp_Merge_LottiControlliAstine_LottiAssemblaggioControlliAstine;
EXEC MRDA.usp_Merge_LottiFermi_LottiAssemblaggioFermi;
EXEC MRDA.usp_Merge_LottiOperatori_LottiAssemblaggioOperatoriAssemblaggio;
EXEC MRDA.usp_Merge_LottiOrdini_LottiAssemblaggioOrdini;
EXEC MRDA.usp_Merge_LottiProduzioni_LottiAssemblaggioProduzioni;
EXEC MRDA.usp_Merge_Operatori_OperatoreAssemblaggio;
EXEC MRDA.usp_Merge_Postazioni_PostazioneAssemblaggio;
EXEC MRDA.usp_Merge_Turni_TurnoAssemblaggio;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_MRDA: Fine', @PKEventSubElaboration;

END;
GO

