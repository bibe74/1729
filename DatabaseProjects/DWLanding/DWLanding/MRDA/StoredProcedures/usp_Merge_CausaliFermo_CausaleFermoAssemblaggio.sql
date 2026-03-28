
CREATE PROCEDURE MRDA.usp_Merge_CausaliFermo_CausaleFermoAssemblaggio
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDA.CausaliFermo_CausaleFermoAssemblaggio', N'U') IS NULL
BEGIN
    EXEC MRDA.usp_Create_CausaliFermo_CausaleFermoAssemblaggio;
    EXEC MRDA.usp_AddIndexes_CausaliFermo_CausaleFermoAssemblaggio;
END;

MERGE INTO MRDA.CausaliFermo_CausaleFermoAssemblaggio AS TGT
USING MRDA.CausaliFermo_CausaleFermoAssemblaggioView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.Descrizione <> SRC.Descrizione OR TGT.Attrezzaggio <> SRC.Attrezzaggio OR TGT.Produzione <> SRC.Produzione OR TGT.Disponibilita <> SRC.Disponibilita OR TGT.EscludiDaCalcoloResa <> SRC.EscludiDaCalcoloResa)
  THEN UPDATE SET TGT.Descrizione = SRC.Descrizione, TGT.Attrezzaggio = SRC.Attrezzaggio, TGT.Produzione = SRC.Produzione, TGT.Disponibilita = SRC.Disponibilita, TGT.EscludiDaCalcoloResa = SRC.EscludiDaCalcoloResa
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, Descrizione, Attrezzaggio, Produzione, Disponibilita, EscludiDaCalcoloResa)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MRDA.CausaliFermo_CausaleFermoAssemblaggio' AS full_olap_table_name,
    'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

