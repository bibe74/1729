
CREATE PROCEDURE EDMSRV2016.usp_Create_AccessorioProgettoProprietario_AccessorioProgettoProprietario
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE EDMSRV2016.AccessorioProgettoProprietario_AccessorioProgettoProprietario (
	-- Chiavi
	Accessorio_Codice		NVARCHAR(15) NOT NULL,

	-- Dimensioni
	Accessorio_ProgettoProprietario		NVARCHAR(255) NOT NULL


	-- Constraint
	CONSTRAINT PK_EDMSRV2016_AccessorioProgettoProprietario_AccessorioProgettoProprietario PRIMARY KEY CLUSTERED (
		Accessorio_Codice
	)
);

END;
GO

