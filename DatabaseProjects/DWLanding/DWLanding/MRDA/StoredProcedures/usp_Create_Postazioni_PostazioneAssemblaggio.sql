
CREATE PROCEDURE MRDA.usp_Create_Postazioni_PostazioneAssemblaggio
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDA.Postazioni_PostazioneAssemblaggio (
	-- Chiavi
	ID		NVARCHAR(50) NOT NULL,

	-- Dimensioni
	Descrizione		NVARCHAR(50),
	WrkCtrId		NVARCHAR(20),
	GroupWrkCtrId		NVARCHAR(20),
	Test		BIT


	-- Constraint
	CONSTRAINT PK_Postazioni_PostazioneAssemblaggio PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

