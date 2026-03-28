
/**
 * @stored_procedure audit.usp_merge_data_from_EDMSRV2016
 * @description Script per caricamento tabelle OLAP - schema EDMSRV2016
*/

CREATE   PROCEDURE audit.usp_merge_data_from_EDMSRV2016
AS
BEGIN

SET NOCOUNT ON;

DECLARE @PKEventSubElaboration BIGINT;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_EDMSRV2016: Inizio', @PKEventSubElaboration;

EXEC EDMSRV2016.usp_Merge_AccessorioProgettoProprietario_AccessorioProgettoProprietario;
EXEC EDMSRV2016.usp_Merge_Document_Documento;
EXEC EDMSRV2016.usp_Merge_DocumentReference_CommesseAccessori;
EXEC EDMSRV2016.usp_Merge_DocumentRevision_ProfiliIndustria;
EXEC EDMSRV2016.usp_Merge_DocumentRevisionCustom_ProfiliIndustriaDatiCustom;
EXEC EDMSRV2016.usp_Merge_DocumentType_TipoDocumento;
EXEC EDMSRV2016.usp_Merge_Folder_Cartella;

EXEC audit.usp_LogEvent N'audit.usp_merge_data_from_EDMSRV2016: Fine', @PKEventSubElaboration;

END;
GO

