CREATE PROCEDURE MRDA.usp_Merge_Lotti_LottiAssemblaggio
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDA.Lotti_LottiAssemblaggio', N'U') IS NULL
BEGIN
    EXEC MRDA.usp_Create_Lotti_LottiAssemblaggio;
    EXEC MRDA.usp_AddIndexes_Lotti_LottiAssemblaggio;
END;

MERGE INTO MRDA.Lotti_LottiAssemblaggio AS TGT
USING MRDA.Lotti_LottiAssemblaggioView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.IDTurno <> SRC.IDTurno OR TGT.IDPostazione <> SRC.IDPostazione OR TGT.IDCausaleChiusura <> SRC.IDCausaleChiusura OR TGT.NumeroLotto <> SRC.NumeroLotto OR TGT.Campionatura <> SRC.Campionatura OR TGT.CodiceCra <> SRC.CodiceCra OR TGT.CodiceArticolo <> SRC.CodiceArticolo OR TGT.TsInizio <> SRC.TsInizio OR TGT.TsFine <> SRC.TsFine OR TGT.Elab_Riconciliare <> SRC.Elab_Riconciliare OR TGT.Elab_Riconciliato <> SRC.Elab_Riconciliato OR TGT.Elab_Diagnostica <> SRC.Elab_Diagnostica OR TGT.Elab_DiagnosticaTs <> SRC.Elab_DiagnosticaTs)
  THEN UPDATE SET TGT.IDTurno = SRC.IDTurno, TGT.IDPostazione = SRC.IDPostazione, TGT.IDCausaleChiusura = SRC.IDCausaleChiusura, TGT.NumeroLotto = SRC.NumeroLotto, TGT.Campionatura = SRC.Campionatura, TGT.CodiceCra = SRC.CodiceCra, TGT.CodiceArticolo = SRC.CodiceArticolo, TGT.TsInizio = SRC.TsInizio, TGT.TsFine = SRC.TsFine, TGT.Elab_Riconciliare = SRC.Elab_Riconciliare, TGT.Elab_Riconciliato = SRC.Elab_Riconciliato, TGT.Elab_Diagnostica = SRC.Elab_Diagnostica, TGT.Elab_DiagnosticaTs = SRC.Elab_DiagnosticaTs
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, IDTurno, IDPostazione, IDCausaleChiusura, NumeroLotto, Campionatura, CodiceCra, CodiceArticolo, TsInizio, TsFine, Elab_Riconciliare, Elab_Riconciliato, Elab_Diagnostica, Elab_DiagnosticaTs)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MRDA.Lotti_LottiAssemblaggio' AS full_olap_table_name,
    'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

