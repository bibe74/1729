
CREATE VIEW EDMSRV2016.Document_DocumentoView
AS
SELECT
	-- Chiavi
	ID,		-- IDDocumento

	-- Dimensioni
	COALESCE(FolderID, N'') AS FolderID		-- IDCartella

FROM EDMSRV2016.BCRepository.dbo.Document;
GO

