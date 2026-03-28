
CREATE PROCEDURE IRDP.usp_Merge_RaccoltaDatiLotto_Lotti_Lotti
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'IRDP.RaccoltaDatiLotto_Lotti_Lotti', N'U') IS NULL
BEGIN
	EXEC IRDP.usp_Create_RaccoltaDatiLotto_Lotti_Lotti;
	EXEC IRDP.usp_AddIndexes_RaccoltaDatiLotto_Lotti_Lotti;
END;

MERGE INTO IRDP.RaccoltaDatiLotto_Lotti_Lotti AS TGT
USING IRDP.RaccoltaDatiLotto_Lotti_LottiView (nolock) AS SRC
ON SRC.NumeroLotto = TGT.NumeroLotto
WHEN MATCHED AND (TGT.IDPressa <> SRC.IDPressa OR TGT.IDCausaleChiusuraLotto <> SRC.IDCausaleChiusuraLotto OR TGT.CodiceMatrice <> SRC.CodiceMatrice OR TGT.NumeroMatrice <> SRC.NumeroMatrice OR TGT.StatoMatrice <> SRC.StatoMatrice OR TGT.CodiceCliente <> SRC.CodiceCliente OR TGT.ChiusuraLotto <> SRC.ChiusuraLotto OR TGT.ChiusuraLottoDataOra <> SRC.ChiusuraLottoDataOra OR TGT.ChiusuraIncestamento <> SRC.ChiusuraIncestamento OR TGT.ChiusuraIncestamentoDataOra <> SRC.ChiusuraIncestamentoDataOra OR TGT.PrimaBilletta <> SRC.PrimaBilletta OR TGT.PesoProfiloAlMetroScada <> SRC.PesoProfiloAlMetroScada OR TGT.PesoProfiloAlMetroAnagrafica <> SRC.PesoProfiloAlMetroAnagrafica OR TGT.PesoProfiloAlMetroCollaudo <> SRC.PesoProfiloAlMetroCollaudo OR TGT.PesoProfiloAlMetro <> SRC.PesoProfiloAlMetro OR TGT.TimeStart <> SRC.TimeStart OR TGT.TimeStop <> SRC.TimeStop OR TGT.Campionatura <> SRC.Campionatura OR TGT.Lega <> SRC.Lega OR TGT.LegaTrattamento <> SRC.LegaTrattamento OR TGT.Elab_Riconciliato <> SRC.Elab_Riconciliato OR TGT.ProdUtilizzoGrafite <> SRC.ProdUtilizzoGrafite OR TGT.KgLordiPressa <> SRC.KgLordiPressa OR TGT.KgScartoCesoia <> SRC.KgScartoCesoia OR TGT.KgEstrusi <> SRC.KgEstrusi OR TGT.KgTagliati <> SRC.KgTagliati OR TGT.KgImballati <> SRC.KgImballati OR TGT.KgScartoImballo <> SRC.KgScartoImballo)
  THEN UPDATE SET TGT.IDPressa = SRC.IDPressa, TGT.IDCausaleChiusuraLotto = SRC.IDCausaleChiusuraLotto, TGT.CodiceMatrice = SRC.CodiceMatrice, TGT.NumeroMatrice = SRC.NumeroMatrice, TGT.StatoMatrice = SRC.StatoMatrice, TGT.CodiceCliente = SRC.CodiceCliente, TGT.ChiusuraLotto = SRC.ChiusuraLotto, TGT.ChiusuraLottoDataOra = SRC.ChiusuraLottoDataOra, TGT.ChiusuraIncestamento = SRC.ChiusuraIncestamento, TGT.ChiusuraIncestamentoDataOra = SRC.ChiusuraIncestamentoDataOra, TGT.PrimaBilletta = SRC.PrimaBilletta, TGT.PesoProfiloAlMetroScada = SRC.PesoProfiloAlMetroScada, TGT.PesoProfiloAlMetroAnagrafica = SRC.PesoProfiloAlMetroAnagrafica, TGT.PesoProfiloAlMetroCollaudo = SRC.PesoProfiloAlMetroCollaudo, TGT.PesoProfiloAlMetro = SRC.PesoProfiloAlMetro, TGT.TimeStart = SRC.TimeStart, TGT.TimeStop = SRC.TimeStop, TGT.Campionatura = SRC.Campionatura, TGT.Lega = SRC.Lega, TGT.LegaTrattamento = SRC.LegaTrattamento, TGT.Elab_Riconciliato = SRC.Elab_Riconciliato, TGT.ProdUtilizzoGrafite = SRC.ProdUtilizzoGrafite, TGT.KgLordiPressa = SRC.KgLordiPressa, TGT.KgScartoCesoia = SRC.KgScartoCesoia, TGT.KgEstrusi = SRC.KgEstrusi, TGT.KgTagliati = SRC.KgTagliati, TGT.KgImballati = SRC.KgImballati, TGT.KgScartoImballo = SRC.KgScartoImballo
WHEN NOT MATCHED
  THEN INSERT VALUES (NumeroLotto, ID, IDPressa, IDCausaleChiusuraLotto, CodiceMatrice, NumeroMatrice, StatoMatrice, CodiceCliente, ChiusuraLotto, ChiusuraLottoDataOra, ChiusuraIncestamento, ChiusuraIncestamentoDataOra, PrimaBilletta, PesoProfiloAlMetroScada, PesoProfiloAlMetroAnagrafica, PesoProfiloAlMetroCollaudo, PesoProfiloAlMetro, TimeStart, TimeStop, Campionatura, Lega, LegaTrattamento, Elab_Riconciliato, ProdUtilizzoGrafite, KgLordiPressa, KgScartoCesoia, KgEstrusi, KgTagliati, KgImballati, KgScartoImballo)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'IRDP.RaccoltaDatiLotto_Lotti_Lotti' AS full_olap_table_name,
	'NumeroLotto = ' + CAST(COALESCE(inserted.NumeroLotto, deleted.NumeroLotto) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

