
CREATE VIEW MRDA.Operatori_OperatoreAssemblaggioView
AS
SELECT
	-- Chiavi
	ID,		-- IDOperatoreAssemblaggio

	-- Dimensioni
	Cognome,		-- Cognome
	Nome		-- Nome

FROM [SQL2014\SCADA2014].RaccoltaDatiAssemblaggio.Anagrafica.Operatori;
GO

