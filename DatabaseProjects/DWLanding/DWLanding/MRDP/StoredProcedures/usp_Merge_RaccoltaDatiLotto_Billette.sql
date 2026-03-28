
CREATE PROCEDURE MRDP.usp_Merge_RaccoltaDatiLotto_Billette
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDP.RaccoltaDatiLotto_Billette', N'U') IS NULL
BEGIN
	EXEC MRDP.usp_Create_RaccoltaDatiLotto_Billette;
	EXEC MRDP.usp_AddIndexes_RaccoltaDatiLotto_Billette;
END;

MERGE INTO MRDP.RaccoltaDatiLotto_Billette AS TGT
USING MRDP.RaccoltaDatiLotto_BilletteView (nolock) AS SRC
ON SRC.NumeroLotto = TGT.NumeroLotto AND SRC.NumeroBilletta = TGT.NumeroBilletta AND SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.IDCausaleProduzioneRidotta <> SRC.IDCausaleProduzioneRidotta OR TGT.IDCausaleChiusuraLotto <> SRC.IDCausaleChiusuraLotto OR TGT.ChiusuraLotto <> SRC.ChiusuraLotto OR TGT.CodiceMatrice <> SRC.CodiceMatrice OR TGT.NumeroMatrice <> SRC.NumeroMatrice OR TGT.TimeStartCiclo <> SRC.TimeStartCiclo OR TGT.TimeStart <> SRC.TimeStart OR TGT.TimeStop <> SRC.TimeStop OR TGT.TimeStopCiclo <> SRC.TimeStopCiclo OR TGT.LunghezzaBarra <> SRC.LunghezzaBarra OR TGT.LunghezzaBillettaEstrusa <> SRC.LunghezzaBillettaEstrusa OR TGT.CodiceColata <> SRC.CodiceColata OR TGT.PesoProfiloAlMetro <> SRC.PesoProfiloAlMetro OR TGT.LunghezzaFondello <> SRC.LunghezzaFondello OR TGT.KgLordiPressa <> SRC.KgLordiPressa OR TGT.KgEstrusi <> SRC.KgEstrusi OR TGT.SecondiEstrusioneNetti <> SRC.SecondiEstrusioneNetti)
  THEN UPDATE SET TGT.IDCausaleProduzioneRidotta = SRC.IDCausaleProduzioneRidotta, TGT.IDCausaleChiusuraLotto = SRC.IDCausaleChiusuraLotto, TGT.ChiusuraLotto = SRC.ChiusuraLotto, TGT.CodiceMatrice = SRC.CodiceMatrice, TGT.NumeroMatrice = SRC.NumeroMatrice, TGT.TimeStartCiclo = SRC.TimeStartCiclo, TGT.TimeStart = SRC.TimeStart, TGT.TimeStop = SRC.TimeStop, TGT.TimeStopCiclo = SRC.TimeStopCiclo, TGT.LunghezzaBarra = SRC.LunghezzaBarra, TGT.LunghezzaBillettaEstrusa = SRC.LunghezzaBillettaEstrusa, TGT.CodiceColata = SRC.CodiceColata, TGT.PesoProfiloAlMetro = SRC.PesoProfiloAlMetro, TGT.LunghezzaFondello = SRC.LunghezzaFondello, TGT.KgLordiPressa = SRC.KgLordiPressa, TGT.KgEstrusi = SRC.KgEstrusi, TGT.SecondiEstrusioneNetti = SRC.SecondiEstrusioneNetti
WHEN NOT MATCHED
  THEN INSERT VALUES (NumeroLotto, NumeroBilletta, ID, IDCausaleProduzioneRidotta, IDCausaleChiusuraLotto, ChiusuraLotto, CodiceMatrice, NumeroMatrice, TimeStartCiclo, TimeStart, TimeStop, TimeStopCiclo, LunghezzaBarra, LunghezzaBillettaEstrusa, CodiceColata, PesoProfiloAlMetro, LunghezzaFondello, KgLordiPressa, KgEstrusi, SecondiEstrusioneNetti)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'MRDP.RaccoltaDatiLotto_Billette' AS full_olap_table_name,
	'NumeroLotto = ' + CAST(COALESCE(inserted.NumeroLotto, deleted.NumeroLotto) AS NVARCHAR) + ' - ' + 'NumeroBilletta = ' + CAST(COALESCE(inserted.NumeroBilletta, deleted.NumeroBilletta) AS NVARCHAR) + ' - ' + 'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

