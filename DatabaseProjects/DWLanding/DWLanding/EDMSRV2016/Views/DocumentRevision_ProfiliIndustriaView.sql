
CREATE VIEW EDMSRV2016.DocumentRevision_ProfiliIndustriaView
AS
SELECT
	-- Chiavi
	ID,		-- PKProfiliIndustria

	-- Dimensioni
	DocumentID,		-- IDDocumento
	Filename COLLATE Latin1_General_CI_AS AS Filename,		-- Nome
	DocumentTypeID,		-- IDTipoDocumento
	RevisionNumber COLLATE Latin1_General_CI_AS AS RevisionNumber,		-- NumeroRevisione
	IsLatestRevision,		-- IsUltimaRevisione
	CONVERT(DATE, StartDate) AS StartDate,		-- DataInizio
	CONVERT(DATE, ModificationDate) AS ModificationDate		-- DataModifica

FROM EDMSRV2016.BCRepository.dbo.DocumentRevision
WHERE RevisionNumber IS NOT NULL;
GO

