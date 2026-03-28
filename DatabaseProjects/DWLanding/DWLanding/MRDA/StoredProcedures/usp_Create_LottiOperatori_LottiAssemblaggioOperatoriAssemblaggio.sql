
CREATE PROCEDURE MRDA.usp_Create_LottiOperatori_LottiAssemblaggioOperatoriAssemblaggio
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDA.LottiOperatori_LottiAssemblaggioOperatoriAssemblaggio (
	-- Chiavi
	ID		INT NOT NULL,

	-- Dimensioni
	IDLotto		INT NOT NULL,
	IDOperatore		NVARCHAR(10) NOT NULL


	-- Constraint
	CONSTRAINT PK_LottiOperatori_LottiAssemblaggioOperatoriAssemblaggio PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

