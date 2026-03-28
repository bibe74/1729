
CREATE VIEW RRDP.RaccoltaDatiLotto_BilletteView
AS
SELECT
	-- Chiavi
	NumeroLotto,		-- NumeroLotto
	NumeroBilletta,		-- NumeroBilletta
	ID,		-- PKBillette

	-- Dimensioni
	COALESCE(IDCausaleProduzioneRidotta, -1) AS IDCausaleProduzioneRidotta,		-- IDCausaleProduzioneRidotta
	COALESCE(IDCausaleChiusuraLotto, -1) AS IDCausaleChiusuraLotto,		-- IDCausaleChiusuraLotto_Billetta
	COALESCE(ChiusuraLotto, -1) AS ChiusuraLotto,		-- ChiusuraLotto
	COALESCE(CodiceMatrice, '') AS CodiceMatrice,		-- CodiceMatrice
	COALESCE(NumeroMatrice, 0) AS NumeroMatrice,		-- NumeroMatrice
	COALESCE(TimeStartCiclo, '19000101') AS TimeStartCiclo,		-- TimeStartCiclo
	COALESCE(TimeStart, '19000101') AS TimeStart,		-- TimeStart
	COALESCE(TimeStop, '19000101') AS TimeStop,		-- TimeStop
	COALESCE(TimeStopCiclo, '19000101') AS TimeStopCiclo,		-- TimeStopCiclo
	COALESCE(LunghezzaBarra, 0) AS LunghezzaBarra,		-- LunghezzaBarra
	CONVERT(DECIMAL(28, 12), COALESCE(LunghezzaBillettaEstrusa, 0.0)) AS LunghezzaBillettaEstrusa,		-- LunghezzaBillettaEstrusa
	COALESCE(CodiceColata, '') AS CodiceColata,		-- CodiceColata
	CONVERT(DECIMAL(28, 12), COALESCE(PesoProfiloAlMetro, 0.0)) AS PesoProfiloAlMetro,		-- PesoProfiloAlMetro
	CONVERT(DECIMAL(28, 12), COALESCE(LunghezzaFondello, 0.0)) AS LunghezzaFondello,		-- LunghezzaFondello

	-- Misure
	CONVERT(DECIMAL(28, 12), COALESCE(KgLordiPressa, 0.0)) AS KgLordiPressa,		-- KgConsumati
	CONVERT(DECIMAL(28, 12), COALESCE(KgEstrusi, 0.0)) AS KgEstrusi,		-- KgEstrusi
	CONVERT(SMALLINT, COALESCE(SecondiEstrusioneNetti, 0)) AS SecondiEstrusioneNetti		-- SecondiEstrusioneNetti

FROM [SQL2014MRAG\SCADA2014].RaccoltaDatiProduzione.dbo.RaccoltaDatiLotto
WHERE NumeroLotto IS NOT NULL
	AND NumeroBilletta IS NOT NULL;
GO

