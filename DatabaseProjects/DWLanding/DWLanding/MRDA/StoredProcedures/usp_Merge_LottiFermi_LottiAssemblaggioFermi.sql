
CREATE PROCEDURE MRDA.usp_Merge_LottiFermi_LottiAssemblaggioFermi
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDA.LottiFermi_LottiAssemblaggioFermi', N'U') IS NULL
BEGIN
    EXEC MRDA.usp_Create_LottiFermi_LottiAssemblaggioFermi;
    EXEC MRDA.usp_AddIndexes_LottiFermi_LottiAssemblaggioFermi;
END;

MERGE INTO MRDA.LottiFermi_LottiAssemblaggioFermi AS TGT
USING MRDA.LottiFermi_LottiAssemblaggioFermiView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.IDLotto <> SRC.IDLotto OR TGT.IDCausaleFermo <> SRC.IDCausaleFermo OR TGT.Inizio_Ts <> SRC.Inizio_Ts OR TGT.Fine_Ts <> SRC.Fine_Ts OR TGT.Tipo <> SRC.Tipo OR TGT.IDPostazione <> SRC.IDPostazione)
  THEN UPDATE SET TGT.IDLotto = SRC.IDLotto, TGT.IDCausaleFermo = SRC.IDCausaleFermo, TGT.Inizio_Ts = SRC.Inizio_Ts, TGT.Fine_Ts = SRC.Fine_Ts, TGT.Tipo = SRC.Tipo, TGT.IDPostazione = SRC.IDPostazione
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, IDLotto, IDCausaleFermo, Inizio_Ts, Fine_Ts, Tipo, IDPostazione)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MRDA.LottiFermi_LottiAssemblaggioFermi' AS full_olap_table_name,
    'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

