
CREATE VIEW METRADTE.MetraDTE_AttivitaPreliminari_AttivitaPreliminareView
AS
SELECT
	-- Chiavi
	ID,  -- IDAttivitaPreliminare

	-- Dimensioni
	COALESCE(projectManager, N'') AS projectManager,  -- IDUtenteProjectManager
	COALESCE(attivita, N'') AS attivita,  -- AttivitaPreliminare
	COALESCE(aperta, CAST(1 AS BIT)) AS aperta, -- IsAperta
	COALESCE(codiceCliente, N'') AS codiceCliente,  -- IDCliente
	COALESCE(riferimentoAttivitaUnivoco, N'') AS riferimentoAttivitaUnivoco,  -- RiferimentoAttivita
	COALESCE(personaRiferimentoRichiedente, N'') AS personaRiferimentoRichiedente,  -- PersonaRiferimentoRichiedente
	COALESCE(CONVERT(DATE, dataRicezioneEffettiva), CAST('19000101' AS DATE)) AS dataRicezioneEffettiva,  -- DataRicezioneEffettiva
	COALESCE(dataChiusura, CAST('19000101' AS DATE)) AS dataChiusura,  -- DataChiusura
	COALESCE(CONVERT(DATE, _dataInsert), CAST('19000101' AS DATE)) AS _dataInsert,  -- DataInserimento
	COALESCE(_IDUtenteInsert, -1) AS _IDUtenteInsert,  -- IDUtenteInserimento
    COALESCE(ambito, N'') AS ambito -- Ambito

FROM [SQL2014\DB2014].wwwMetraIt.dbo.MetraDTE_AttivitaPreliminari;
GO

