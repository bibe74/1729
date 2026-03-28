
CREATE PROCEDURE METRADTE.usp_Create_MetraDTE_AttivitaPreliminari_AttivitaPreliminare
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE METRADTE.MetraDTE_AttivitaPreliminari_AttivitaPreliminare (
	-- Chiavi
	ID  BIGINT NOT NULL,

	-- Dimensioni
	projectManager  NVARCHAR(50),
	attivita  NVARCHAR(100),
	aperta  BIT,
	codiceCliente  NVARCHAR(50),
	riferimentoAttivitaUnivoco  NVARCHAR(250),
	personaRiferimentoRichiedente  NVARCHAR(250),
	dataRicezioneEffettiva  DATE,
	dataChiusura  DATE,
	_dataInsert  DATE,
	_IDUtenteInsert  BIGINT,
    ambito NVARCHAR(50)


	-- Constraint
	CONSTRAINT PK_MetraDTE_AttivitaPreliminari_AttivitaPreliminare PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

