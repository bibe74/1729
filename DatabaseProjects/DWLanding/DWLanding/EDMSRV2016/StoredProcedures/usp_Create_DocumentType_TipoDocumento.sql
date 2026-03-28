
CREATE PROCEDURE EDMSRV2016.usp_Create_DocumentType_TipoDocumento
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE EDMSRV2016.DocumentType_TipoDocumento (
	-- Chiavi
	ID		INT NOT NULL,

	-- Dimensioni
	Name		NVARCHAR(255) NOT NULL,
	DisplayName		NVARCHAR(255) NOT NULL


	-- Constraint
	CONSTRAINT PK_EDMSRV2016_DocumentType_TipoDocumento PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

