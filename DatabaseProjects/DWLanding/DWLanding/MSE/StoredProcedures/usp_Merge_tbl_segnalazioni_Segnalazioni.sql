
CREATE PROCEDURE MSE.usp_Merge_tbl_segnalazioni_Segnalazioni
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID('MSE.tbl_segnalazioni_Segnalazioni', N'U') IS NULL
BEGIN
    EXEC MSE.usp_Create_tbl_segnalazioni_Segnalazioni;
    EXEC MSE.usp_AddIndexes_tbl_segnalazioni_Segnalazioni;
END;

MERGE INTO MSE.tbl_segnalazioni_Segnalazioni AS TGT
USING MSE.tbl_segnalazioni_SegnalazioniView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.data <> SRC.data OR TGT.sigla <> SRC.sigla OR TGT.codiceCliente <> SRC.codiceCliente OR TGT.bolla_n <> SRC.bolla_n OR TGT.bolla_del <> SRC.bolla_del OR TGT.finitura_altro <> SRC.finitura_altro OR TGT.Company <> SRC.Company OR TGT.DataChiusuraSegnalazione <> SRC.DataChiusuraSegnalazione OR TGT.NumeroOrdineAX <> SRC.NumeroOrdineAX)
  THEN UPDATE SET TGT.data = SRC.data, TGT.sigla = SRC.sigla, TGT.codiceCliente = SRC.codiceCliente, TGT.bolla_n = SRC.bolla_n, TGT.bolla_del = SRC.bolla_del, TGT.finitura_altro = SRC.finitura_altro, TGT.Company = SRC.Company, TGT.DataChiusuraSegnalazione = SRC.DataChiusuraSegnalazione, TGT.NumeroOrdineAX = SRC.NumeroOrdineAX
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, data, sigla, codiceCliente, bolla_n, bolla_del, finitura_altro, Company, DataChiusuraSegnalazione, NumeroOrdineAX)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MSE.tbl_segnalazioni_Segnalazioni' AS full_olap_table_name,
    'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

