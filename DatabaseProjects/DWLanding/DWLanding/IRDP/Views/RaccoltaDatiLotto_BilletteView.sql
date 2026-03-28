
CREATE VIEW IRDP.RaccoltaDatiLotto_BilletteView
AS
SELECT
	-- Chiavi
	NumeroLotto,		-- NumeroLotto
	NumeroBilletta,		-- NumeroBilletta
	ID,		-- PKBillette

	-- Dimensioni
	IDCausaleProduzioneRidotta,		-- IDCausaleProduzioneRidotta
	IDCausaleChiusuraLotto,		-- IDCausaleChiusuraLotto_Billetta
	TimeStartCiclo,		-- TimeStartCiclo
	TimeStart,		-- TimeStart
	TimeStop,		-- TimeStop
	TimeStopCiclo,		-- TimeStopCiclo
	LunghezzaBarra,		-- LunghezzaBarra
	LunghezzaBillettaEstrusa,		-- LunghezzaBillettaEstrusa
	CodiceColata,		-- CodiceColata
	LunghezzaFondello,		-- LunghezzaFondello
	Campionatura,		-- IsCampionatura
	Elab_Turno,		-- NumeroTurno
	Elab_TurnoData,		-- Data
	Elab_TurnoDataMetra,		-- DataTurno

	-- Misure
	KgLordiPressa,		-- KgConsumati
	KgEstrusi,		-- KgEstrusi
	Elab_KgNettiTaglio,		-- KgTagliati
	Elab_KgNettiImballo,		-- KgImballati
	Elab_SecondiFermo		-- SecondiFermo

FROM [SQL2012IMET\SCADA2012].Metra_RaccoltaDatiProduzione.dbo.RaccoltaDatiLotto
WHERE NumeroLotto IS NOT NULL
	AND NumeroBilletta IS NOT NULL;
GO

