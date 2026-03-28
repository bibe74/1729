
CREATE PROCEDURE IRDP.usp_Merge_RaccoltaDatiLotto_Billette
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'IRDP.RaccoltaDatiLotto_Billette', N'U') IS NULL
BEGIN
	EXEC IRDP.usp_Create_RaccoltaDatiLotto_Billette;
	EXEC IRDP.usp_AddIndexes_RaccoltaDatiLotto_Billette;
END;

MERGE INTO IRDP.RaccoltaDatiLotto_Billette AS TGT
USING IRDP.RaccoltaDatiLotto_BilletteView (nolock) AS SRC
ON SRC.NumeroLotto = TGT.NumeroLotto AND SRC.NumeroBilletta = TGT.NumeroBilletta AND SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.IDCausaleProduzioneRidotta <> SRC.IDCausaleProduzioneRidotta OR TGT.IDCausaleChiusuraLotto <> SRC.IDCausaleChiusuraLotto OR TGT.TimeStartCiclo <> SRC.TimeStartCiclo OR TGT.TimeStart <> SRC.TimeStart OR TGT.TimeStop <> SRC.TimeStop OR TGT.TimeStopCiclo <> SRC.TimeStopCiclo OR TGT.LunghezzaBarra <> SRC.LunghezzaBarra OR TGT.LunghezzaBillettaEstrusa <> SRC.LunghezzaBillettaEstrusa OR TGT.CodiceColata <> SRC.CodiceColata OR TGT.LunghezzaFondello <> SRC.LunghezzaFondello OR TGT.Campionatura <> SRC.Campionatura OR TGT.Elab_Turno <> SRC.Elab_Turno OR TGT.Elab_TurnoData <> SRC.Elab_TurnoData OR TGT.Elab_TurnoDataMetra <> SRC.Elab_TurnoDataMetra OR TGT.KgLordiPressa <> SRC.KgLordiPressa OR TGT.KgEstrusi <> SRC.KgEstrusi OR TGT.Elab_KgNettiTaglio <> SRC.Elab_KgNettiTaglio OR TGT.Elab_KgNettiImballo <> SRC.Elab_KgNettiImballo OR TGT.Elab_SecondiFermo <> SRC.Elab_SecondiFermo)
  THEN UPDATE SET TGT.IDCausaleProduzioneRidotta = SRC.IDCausaleProduzioneRidotta, TGT.IDCausaleChiusuraLotto = SRC.IDCausaleChiusuraLotto, TGT.TimeStartCiclo = SRC.TimeStartCiclo, TGT.TimeStart = SRC.TimeStart, TGT.TimeStop = SRC.TimeStop, TGT.TimeStopCiclo = SRC.TimeStopCiclo, TGT.LunghezzaBarra = SRC.LunghezzaBarra, TGT.LunghezzaBillettaEstrusa = SRC.LunghezzaBillettaEstrusa, TGT.CodiceColata = SRC.CodiceColata, TGT.LunghezzaFondello = SRC.LunghezzaFondello, TGT.Campionatura = SRC.Campionatura, TGT.Elab_Turno = SRC.Elab_Turno, TGT.Elab_TurnoData = SRC.Elab_TurnoData, TGT.Elab_TurnoDataMetra = SRC.Elab_TurnoDataMetra, TGT.KgLordiPressa = SRC.KgLordiPressa, TGT.KgEstrusi = SRC.KgEstrusi, TGT.Elab_KgNettiTaglio = SRC.Elab_KgNettiTaglio, TGT.Elab_KgNettiImballo = SRC.Elab_KgNettiImballo, TGT.Elab_SecondiFermo = SRC.Elab_SecondiFermo
WHEN NOT MATCHED
  THEN INSERT VALUES (NumeroLotto, NumeroBilletta, ID, IDCausaleProduzioneRidotta, IDCausaleChiusuraLotto, TimeStartCiclo, TimeStart, TimeStop, TimeStopCiclo, LunghezzaBarra, LunghezzaBillettaEstrusa, CodiceColata, LunghezzaFondello, Campionatura, Elab_Turno, Elab_TurnoData, Elab_TurnoDataMetra, KgLordiPressa, KgEstrusi, Elab_KgNettiTaglio, Elab_KgNettiImballo, Elab_SecondiFermo)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'IRDP.RaccoltaDatiLotto_Billette' AS full_olap_table_name,
	'NumeroLotto = ' + CAST(COALESCE(inserted.NumeroLotto, deleted.NumeroLotto) AS NVARCHAR) + ' - ' + 'NumeroBilletta = ' + CAST(COALESCE(inserted.NumeroBilletta, deleted.NumeroBilletta) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

