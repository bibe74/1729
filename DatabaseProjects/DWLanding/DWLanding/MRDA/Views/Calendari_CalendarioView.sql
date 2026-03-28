CREATE   VIEW MRDA.Calendari_CalendarioView
AS
SELECT
	-- Chiavi
	IDPostazione,
	TransDate,
	TsStart,

	-- Dimensioni
    TsStop
FROM [SQL2014\SCADA2014].RaccoltaDatiAssemblaggio.dbo.Calendari;
GO

