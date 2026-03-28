
CREATE PROCEDURE MRDP.usp_Create_Presse_Pressa
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDP.Presse_Pressa (
	-- Chiavi
	ID		CHAR(3) NOT NULL,

	-- Dimensioni
	IDPressaAs400		CHAR(2) NOT NULL,
	Descrizione		NVARCHAR(100) NOT NULL


	-- Constraint
	CONSTRAINT PK_Presse_Pressa PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

