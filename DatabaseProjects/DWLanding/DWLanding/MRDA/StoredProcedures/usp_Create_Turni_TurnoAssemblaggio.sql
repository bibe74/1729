
CREATE PROCEDURE MRDA.usp_Create_Turni_TurnoAssemblaggio
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDA.Turni_TurnoAssemblaggio (
	-- Chiavi
	ID		NVARCHAR(50) NOT NULL,

	-- Dimensioni
	OraInizio		NCHAR(10),
	OraFine		NCHAR(10)


	-- Constraint
	CONSTRAINT PK_Turni_TurnoAssemblaggio PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

