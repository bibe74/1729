
CREATE VIEW MRDA.Turni_TurnoAssemblaggioView
AS
SELECT
	-- Chiavi
	ID,		-- IDTurno

	-- Dimensioni
	OraInizio,		-- OraInizio
	OraFine		-- OraFine

FROM [SQL2014\SCADA2014].RaccoltaDatiAssemblaggio.Anagrafica.Turni;
GO

