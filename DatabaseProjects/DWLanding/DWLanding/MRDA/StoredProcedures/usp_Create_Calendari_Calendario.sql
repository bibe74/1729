CREATE   PROCEDURE MRDA.usp_Create_Calendari_Calendario
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDA.Calendari_Calendario (
	-- Chiavi
	IDPostazione NVARCHAR(50) NOT NULL,
	TransDate DATE NOT NULL,
	TsStart DATETIME NOT NULL,

	-- Dimensioni
	TsStop DATETIME NOT NULL


	-- Constraint
	CONSTRAINT PK_Calendari_Calendario PRIMARY KEY CLUSTERED (
		IDPostazione,
		TransDate,
		TsStart
	)
);

END;
GO

