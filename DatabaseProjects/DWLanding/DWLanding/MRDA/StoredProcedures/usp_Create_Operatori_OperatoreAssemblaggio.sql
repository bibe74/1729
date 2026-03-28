
CREATE PROCEDURE MRDA.usp_Create_Operatori_OperatoreAssemblaggio
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDA.Operatori_OperatoreAssemblaggio (
	-- Chiavi
	ID		NVARCHAR(10) NOT NULL,

	-- Dimensioni
	Cognome		NVARCHAR(50) NOT NULL,
	Nome		NVARCHAR(50)


	-- Constraint
	CONSTRAINT PK_Operatori_OperatoreAssemblaggio PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

