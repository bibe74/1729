
CREATE PROCEDURE MRDA.usp_Merge_LottiAttrezzaggi_LottiAssemblaggioAttrezzaggi
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MRDA.LottiAttrezzaggi_LottiAssemblaggioAttrezzaggi', N'U') IS NULL
BEGIN
    EXEC MRDA.usp_Create_LottiAttrezzaggi_LottiAssemblaggioAttrezzaggi;
    EXEC MRDA.usp_AddIndexes_LottiAttrezzaggi_LottiAssemblaggioAttrezzaggi;
END;

MERGE INTO MRDA.LottiAttrezzaggi_LottiAssemblaggioAttrezzaggi AS TGT
USING MRDA.LottiAttrezzaggi_LottiAssemblaggioAttrezzaggiView (nolock) AS SRC
ON SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.IDLotto <> SRC.IDLotto OR TGT.Inizio_Ts <> SRC.Inizio_Ts OR TGT.Fine_Ts <> SRC.Fine_Ts)
  THEN UPDATE SET TGT.IDLotto = SRC.IDLotto, TGT.Inizio_Ts = SRC.Inizio_Ts, TGT.Fine_Ts = SRC.Fine_Ts
WHEN NOT MATCHED
  THEN INSERT VALUES (ID, IDLotto, Inizio_Ts, Fine_Ts)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MRDA.LottiAttrezzaggi_LottiAssemblaggioAttrezzaggi' AS full_olap_table_name,
    'ID = ' + CAST(COALESCE(inserted.ID, deleted.ID) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

