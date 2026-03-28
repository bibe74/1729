
CREATE VIEW MRDA.Postazioni_PostazioneAssemblaggioView
AS
SELECT
	-- Chiavi
	ID,		-- IDPostazioneAssemblaggio

	-- Dimensioni
	Descrizione,		-- PostazioneAssemblaggio
	WrkCtrId,		-- IDCentroDiLavoro
	GroupWrkCtrId,		-- IDGruppoCentroDiLavoro
	COALESCE(Test, 0) AS Test		-- IsTest

FROM [SQL2014\SCADA2014].RaccoltaDatiAssemblaggio.Anagrafica.Postazioni;
GO

