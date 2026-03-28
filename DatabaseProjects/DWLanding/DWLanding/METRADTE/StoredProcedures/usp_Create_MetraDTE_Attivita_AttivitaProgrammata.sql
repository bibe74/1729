
CREATE PROCEDURE METRADTE.usp_Create_MetraDTE_Attivita_AttivitaProgrammata
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE METRADTE.MetraDTE_Attivita_AttivitaProgrammata (
	-- Chiavi
	ID  BIGINT NOT NULL,

	-- Dimensioni
	IDSchedaPreliminare  BIGINT,
	incaricato  NVARCHAR(50),
	attivita  NVARCHAR(100),
	riferimentoCommessaNumero  NVARCHAR(250),
	agenteTecnico  NVARCHAR(255),
	_IDUtenteInsert  BIGINT,
    ambito NVARCHAR(50)


	-- Constraint
	CONSTRAINT PK_MetraDTE_Attivita_AttivitaProgrammata PRIMARY KEY CLUSTERED (
		ID
	)
);

END;
GO

