
CREATE VIEW EDMSRV2016.AccessorioProgettoProprietario_AccessorioProgettoProprietarioView
AS
SELECT
	-- Chiavi
	Accessorio_Codice COLLATE Latin1_General_CI_AS AS Accessorio_Codice, -- CodiceAccessorio

	-- Dimensioni
	Accessorio_ProgettoProprietario COLLATE Latin1_General_CI_AS AS Accessorio_ProgettoProprietario -- CommessaProprietaria

FROM EDMSRV2016.BCRepository.dbo.AccessorioProgettoProprietario;
GO

