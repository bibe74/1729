
CREATE VIEW METRADTE.MetraDTE_Attivita_AttivitaProgrammataView
AS
SELECT
	-- Chiavi
	ID,  -- IDAttivitaProgrammata

	-- Dimensioni
	COALESCE(IDSchedaPreliminare, -1) AS IDSchedaPreliminare,  -- IDAttivitaPreliminare
	COALESCE(incaricato, N'') AS incaricato, -- incaricato
	COALESCE(attivita, N'') AS attivita,  -- AttivitaProgrammata
	COALESCE(riferimentoCommessaNumero, N'') AS riferimentoCommessaNumero, -- IDCommessaMeridian
	COALESCE(agenteTecnico, N'') AS agenteTecnico,  -- agenteTecnico
	COALESCE(_IDUtenteInsert, -1) AS _IDUtenteInsert,  -- IDUtente
    COALESCE(ambito, N'') AS ambito -- Ambito

FROM [SQL2014\DB2014].wwwMetraIt.dbo.MetraDTE_Attivita;
GO

