
CREATE VIEW EDMSRV2016.DocumentType_TipoDocumentoView
AS
SELECT
	-- Chiavi
	ID,		-- IDTipoDocumento

	-- Dimensioni
	Name COLLATE Latin1_General_CI_AS AS Name,		-- TipoDocumento
	DisplayName COLLATE Latin1_General_CI_AS AS DisplayName		-- DescrizioneTipoDocumento

FROM EDMSRV2016.BCRepository.dbo.DocumentType;
GO

