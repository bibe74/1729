
CREATE PROCEDURE MRDA.usp_Create_CausaliChiusura_CausaleChiusuraAssemblaggio
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDA.CausaliChiusura_CausaleChiusuraAssemblaggio (
	-- Chiavi
	ID		INT NOT NULL,

	-- Dimensioni
	Descrizione		NVARCHAR(50) NOT NULL


	-- Constraint
	CONSTRAINT PK_CausaliChiusura_CausaleChiusuraAssemblaggio PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

