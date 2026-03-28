
CREATE PROCEDURE RRDP.usp_Merge_RaccoltaDatiLotto_Billette_CalcoliBillette
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'RRDP.RaccoltaDatiLotto_Billette_CalcoliBillette', N'U') IS NULL
BEGIN
	EXEC RRDP.usp_Create_RaccoltaDatiLotto_Billette_CalcoliBillette;
	EXEC RRDP.usp_AddIndexes_RaccoltaDatiLotto_Billette_CalcoliBillette;
END;

MERGE INTO RRDP.RaccoltaDatiLotto_Billette_CalcoliBillette AS TGT
USING RRDP.RaccoltaDatiLotto_Billette_CalcoliBilletteView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.Turno <> SRC.Turno OR TGT.TurnoData <> SRC.TurnoData OR TGT.TurnoDataMetra <> SRC.TurnoDataMetra OR TGT.KgNettiTaglio <> SRC.KgNettiTaglio OR TGT.KgNettiImballo <> SRC.KgNettiImballo OR TGT.SecondiFermo <> SRC.SecondiFermo)
  THEN UPDATE SET TGT.Turno = SRC.Turno, TGT.TurnoData = SRC.TurnoData, TGT.TurnoDataMetra = SRC.TurnoDataMetra, TGT.KgNettiTaglio = SRC.KgNettiTaglio, TGT.KgNettiImballo = SRC.KgNettiImballo, TGT.SecondiFermo = SRC.SecondiFermo
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, Turno, TurnoData, TurnoDataMetra, KgNettiTaglio, KgNettiImballo, SecondiFermo)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'RRDP.RaccoltaDatiLotto_Billette_CalcoliBillette' AS full_olap_table_name,
	'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

