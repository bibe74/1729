CREATE VIEW INTELCO.Anagrafica AS 
SELECT 
	cognome AS Cognome,
	nome AS Nome,
	codiceFiscale AS CodiceFiscale,
	INTELCO.GetBirthDateFromFiscalCode(codiceFiscale) AS DataNascita
FROM INTELCO.Timbrature
GROUP BY cognome,
         nome,
         codiceFiscale
GO

