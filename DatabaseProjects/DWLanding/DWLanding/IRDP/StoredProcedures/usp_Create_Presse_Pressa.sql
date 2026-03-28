
CREATE PROCEDURE IRDP.usp_Create_Presse_Pressa
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE IRDP.Presse_Pressa (
	-- Chiavi
	ID		CHAR(3) NOT NULL,

	-- Dimensioni
	IDPressaAs400		CHAR(2),
	Descrizione		NVARCHAR(100)


	-- Constraint
	CONSTRAINT PK_Presse_Pressa PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

