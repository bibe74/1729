
CREATE PROCEDURE MRDP.usp_Merge_CausaliFermoMacchina_CausaleFermoMacchina
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDP.CausaliFermoMacchina_CausaleFermoMacchina', N'U') IS NULL
BEGIN
    EXEC MRDP.usp_Create_CausaliFermoMacchina_CausaleFermoMacchina;
    EXEC MRDP.usp_AddIndexes_CausaliFermoMacchina_CausaleFermoMacchina;
END;

MERGE INTO MRDP.CausaliFermoMacchina_CausaleFermoMacchina AS TGT
USING MRDP.CausaliFermoMacchina_CausaleFermoMacchinaView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.Descrizione <> SRC.Descrizione OR TGT.ClasseDisp <> SRC.ClasseDisp OR TGT.Attiva <> SRC.Attiva)
  THEN UPDATE SET TGT.Descrizione = SRC.Descrizione, TGT.ClasseDisp = SRC.ClasseDisp, TGT.Attiva = SRC.Attiva
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, Descrizione, ClasseDisp, Attiva)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MRDP.CausaliFermoMacchina_CausaleFermoMacchina' AS full_olap_table_name,
    'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

