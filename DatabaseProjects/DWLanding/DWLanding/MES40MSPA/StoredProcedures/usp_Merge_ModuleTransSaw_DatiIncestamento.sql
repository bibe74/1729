CREATE PROCEDURE MES40MSPA.usp_Merge_ModuleTransSaw_DatiIncestamento
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID('MES40MSPA.ModuleTransSaw_DatiIncestamento', 'U') IS NULL
BEGIN
    EXEC MES40MSPA.usp_Create_ModuleTransSaw_DatiIncestamento;
    EXEC MES40MSPA.usp_AddIndexes_ModuleTransSaw_DatiIncestamento;
END;

MERGE INTO MES40MSPA.ModuleTransSaw_DatiIncestamento AS TGT
USING MES40MSPA.ModuleTransSaw_DatiIncestamentoView (nolock) AS SRC
ON SRC.ModuleTransID = TGT.ModuleTransID
WHEN MATCHED AND (TGT.CreatedTs <> SRC.CreatedTs OR TGT.BarLength <> SRC.BarLength OR TGT.BatchID <> SRC.BatchID OR TGT.Qty <> SRC.Qty)
  THEN UPDATE SET TGT.CreatedTs = SRC.CreatedTs, TGT.BarLength = SRC.BarLength, TGT.BatchID = SRC.BatchID, TGT.Qty = SRC.Qty
WHEN NOT MATCHED
  THEN INSERT VALUES (ModuleTransID, CreatedTs, BarLength, BatchID, Qty)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MES40MSPA.ModuleTransSaw_DatiIncestamento' AS full_olap_table_name,
    'ModuleTransID = ' + CAST(COALESCE(inserted.ModuleTransID, deleted.ModuleTransID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

