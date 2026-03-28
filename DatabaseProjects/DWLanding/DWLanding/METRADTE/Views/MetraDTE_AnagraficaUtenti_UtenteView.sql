
CREATE VIEW METRADTE.MetraDTE_AnagraficaUtenti_UtenteView
AS
SELECT
	-- Chiavi
	ID,  -- IDUtente

	-- Dimensioni
	COALESCE(Nome, N'') AS Nome,  -- Nome
	COALESCE(Cognome, N'') AS Cognome  -- Cognome

FROM [SQL2014\DB2014].wwwMetraIt.dbo.MetraDTE_AnagraficaUtenti;
GO

