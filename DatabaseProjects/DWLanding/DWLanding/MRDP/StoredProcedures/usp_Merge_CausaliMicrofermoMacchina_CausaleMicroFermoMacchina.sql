
CREATE PROCEDURE MRDP.usp_Merge_CausaliMicrofermoMacchina_CausaleMicroFermoMacchina
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDP.CausaliMicrofermoMacchina_CausaleMicroFermoMacchina', N'U') IS NULL
BEGIN
    EXEC MRDP.usp_Create_CausaliMicrofermoMacchina_CausaleMicroFermoMacchina;
    EXEC MRDP.usp_AddIndexes_CausaliMicrofermoMacchina_CausaleMicroFermoMacchina;
END;

MERGE INTO MRDP.CausaliMicrofermoMacchina_CausaleMicroFermoMacchina AS TGT
USING MRDP.CausaliMicrofermoMacchina_CausaleMicroFermoMacchinaView (nolock) AS SRC
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
    'MRDP.CausaliMicrofermoMacchina_CausaleMicroFermoMacchina' AS full_olap_table_name,
    'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

