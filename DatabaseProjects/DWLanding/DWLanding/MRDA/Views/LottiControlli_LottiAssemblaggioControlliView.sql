
CREATE VIEW MRDA.LottiControlli_LottiAssemblaggioControlliView
AS
SELECT
	-- Chiavi
	ID,		-- IDLottoAssemblaggioControllo

	-- Dimensioni
	IDLotto,		-- IDLottoAssemblaggio
	Ts,		-- DataOra
	NumeroBarra,		-- NumeroBarra
	PlanaritaConforme,		-- IsPlanaritaConforme

	-- Misure
	ProvaT_Grezzo,		-- ProvaT_Grezzo
	ProvaT_Grezzo2,		-- ProvaT_Grezzo2
	ProvaT_DopoForno,		-- ProvaT_DopoForno
	ProvaQ_Grezzo,		-- ProvaQ_Grezzo
	ProvaQ_Lunghezza,		-- ProvaQ_Lunghezza
	ProvaQ_Misura,		-- ProvaQ_Misura
	ProvaQ_DopoForno		-- ProvaQ_DopoForno

FROM [SQL2014\SCADA2014].RaccoltaDatiAssemblaggio.dbo.LottiControlli;
GO

