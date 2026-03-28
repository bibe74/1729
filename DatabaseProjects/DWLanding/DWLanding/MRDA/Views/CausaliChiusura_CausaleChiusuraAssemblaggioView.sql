CREATE VIEW MRDA.CausaliChiusura_CausaleChiusuraAssemblaggioView
AS
SELECT
	-- Chiavi
	ID,		-- IDCausaleChiusuraAssemblaggio

	-- Dimensioni
	Descrizione		-- CausaleChiusuraAssemblaggio

FROM [SQL2014\SCADA2014].RaccoltaDatiAssemblaggio.Anagrafica.CausaliChiusura;
GO

