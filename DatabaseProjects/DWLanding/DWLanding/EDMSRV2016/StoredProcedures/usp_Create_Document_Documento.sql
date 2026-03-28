
CREATE PROCEDURE EDMSRV2016.usp_Create_Document_Documento
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE EDMSRV2016.Document_Documento (
	-- Chiavi
	ID		INT NOT NULL,

	-- Dimensioni
	FolderID		INT NOT NULL


	-- Constraint
	CONSTRAINT PK_EDMSRV2016_Document_Documento PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

