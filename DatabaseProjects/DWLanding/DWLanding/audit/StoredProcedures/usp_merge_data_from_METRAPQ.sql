
/**
 * @stored_procedure audit.usp_merge_data_from_METRAPQ
 * @description Script per caricamento tabelle OLAP - schema METRAPQ
*/

CREATE   PROCEDURE audit.usp_merge_data_from_METRAPQ
AS
BEGIN

SET NOCOUNT ON;

DECLARE @PKEventSubElaboration BIGINT;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_METRAPQ: Inizio', @PKEventSubElaboration;

EXEC METRAPQ.usp_Merge_FogliodiproduzionegiornalieraFoall_DatiColata;
EXEC METRAPQ.usp_Merge_Leghediriferimento_Lega;
EXEC METRAPQ.usp_Merge_statoavanzamento_DatiMatrice;
EXEC METRAPQ.usp_Merge_statoavanzamento_RevisioniMatrici;
EXEC METRAPQ.usp_Merge_tblFoallFornitoriBillette_FornitoreBillette;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_METRAPQ: Fine', @PKEventSubElaboration;

END;
GO

