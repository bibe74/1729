
CREATE VIEW MRDP.RaccoltaDatiLotto_Lotti_LottiView
AS
SELECT
	-- Chiavi
	NumeroLotto,		-- NumeroLotto
	ID,		-- PKLotti

	-- Dimensioni
	COALESCE(IDPressa, '') AS IDPressa,		-- IDPressa
	COALESCE(IDCausaleChiusuraLotto, -1) AS IDCausaleChiusuraLotto,		-- IDCausaleChiusuraLotto
	COALESCE(CodiceMatrice, '') AS CodiceMatrice,		-- CodiceMatrice
	COALESCE(NumeroMatrice, 0) AS NumeroMatrice,		-- NumeroMatrice
	COALESCE(StatoMatrice, '') AS StatoMatrice,		-- IDStatoMatrice
	COALESCE(CodiceCliente, N'') AS CodiceCliente,		-- IDCliente
	COALESCE(ChiusuraLotto, 0) AS ChiusuraLotto,		-- IsChiusoPressa
	COALESCE(ChiusuraLottoDataOra, '19000101') AS ChiusuraLottoDataOra,		-- ChiusuraLottoDataOra
	COALESCE(ChiusuraIncestamento, 0) AS ChiusuraIncestamento,		-- IsChiusoIncestamento
	COALESCE(ChiusuraIncestamentoDataOra, '19000101') AS ChiusuraIncestamentoDataOra,		-- ChiusuraIncestamentoDataOra
	COALESCE(PrimaBilletta, 0) AS PrimaBilletta,		-- NumeroPrimaBilletta
	COALESCE(PesoProfiloAlMetroScada, 0.0) AS PesoProfiloAlMetroScada,		-- PesoProfiloAlMetroScada
	COALESCE(PesoProfiloAlMetroAnagrafica, 0.0) AS PesoProfiloAlMetroAnagrafica,		-- PesoProfiloAlMetroAnagrafica
	COALESCE(PesoProfiloAlMetroCollaudo, 0.0) AS PesoProfiloAlMetroCollaudo,		-- PesoProfiloAlMetroCollaudo
	COALESCE(PesoProfiloAlMetro, 0.0) AS PesoProfiloAlMetro,		-- PesoProfiloAlMetro
	COALESCE(TimeStart, '19000101') AS TimeStart,		-- TimeStart
	COALESCE(TimeStop, '19000101') AS TimeStop,		-- TimeStop
	COALESCE(Campionatura, 0) AS Campionatura,		-- IsCampionatura
	COALESCE(Lega, N'') AS Lega,		-- Lega
	COALESCE(LegaTrattamento, N'') AS LegaTrattamento,		-- LegaTrattamento
	COALESCE(Elab_Riconciliato, 0) AS Elab_Riconciliato,		-- IsRiconciliato
	COALESCE(ProdUtilizzoGrafite, 0) AS ProdUtilizzoGrafite,		-- IsUtilizzoGrafite

	-- Misure
	----COALESCE(BarreTagliate, 0) AS BarreTagliate,		-- BarreTagliate
	----COALESCE(BarreImballate, 0) AS BarreImballate,		-- BarreImballate
	----COALESCE(BarreScartateImballo, 0) AS BarreScartateImballo,		-- BarreScartateImballo
	COALESCE(KgLordiPressa, 0.0) AS KgLordiPressa,		-- KgConsumati
	COALESCE(KgScartoCesoia, 0.0) AS KgScartoCesoia,		-- KgScartoCesoia
	COALESCE(KgEstrusi, 0.0) AS KgEstrusi,		-- KgEstrusi
	COALESCE(KgTagliati, 0.0) AS KgTagliati,		-- KgTagliati
	COALESCE(KgImballati, 0.0) AS KgImballati,		-- KgImballati
	COALESCE(KgScartoImballo, 0.0) AS KgScartoImballo		-- KgScartoImballo

FROM [SQL2014\SCADA2014].RaccoltaDatiProduzione.dbo.RaccoltaDatiLotto_Lotti;
GO

