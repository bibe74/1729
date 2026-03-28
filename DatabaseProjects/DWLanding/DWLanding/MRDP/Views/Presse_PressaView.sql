
CREATE VIEW MRDP.Presse_PressaView
AS
SELECT
	-- Chiavi
	ID,		-- IDPressa

	-- Dimensioni
	COALESCE(IDPressaAs400, '') AS IDPressaAS400,		-- IDPressaAS400
	COALESCE(Descrizione, N'') AS Descrizione		-- Pressa

FROM [SQL2014\SCADA2014].RaccoltaDatiProduzione.dbo.Presse;
GO

