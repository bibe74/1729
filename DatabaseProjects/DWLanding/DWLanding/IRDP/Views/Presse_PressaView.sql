
CREATE VIEW IRDP.Presse_PressaView
AS
SELECT
	-- Chiavi
	ID,		-- IDPressa

	-- Dimensioni
	IDPressaAs400,		-- IDPressaAS400
	Descrizione		-- Pressa

FROM [SQL2012IMET\SCADA2012].Metra_RaccoltaDatiProduzione.dbo.Presse;
GO

