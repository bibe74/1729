
CREATE VIEW METRADTE.MetraDTE_AnagraficaAgentiTecnici_AgenteTecnicoView
AS
SELECT
	-- Chiavi
	ID,  -- PKAgenteTecnico

	-- Dimensioni
	COALESCE(NomeCognome, N'') AS NomeCognome  -- AgenteTecnico

FROM [SQL2014\DB2014].wwwMetraIt.dbo.MetraDTE_AnagraficaAgentiTecnici;
GO

