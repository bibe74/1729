
CREATE PROCEDURE RRDP.usp_Merge_ScartiCesoia_ScartiCesoia
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'RRDP.ScartiCesoia_ScartiCesoia', N'U') IS NULL
BEGIN
	EXEC RRDP.usp_Create_ScartiCesoia_ScartiCesoia;
	EXEC RRDP.usp_AddIndexes_ScartiCesoia_ScartiCesoia;
END;

MERGE INTO RRDP.ScartiCesoia_ScartiCesoia AS TGT
USING RRDP.ScartiCesoia_ScartiCesoiaView (nolock) AS SRC
ON SRC.NumeroLotto = TGT.NumeroLotto AND SRC.ID = TGT.ID
WHEN MATCHED AND (TGT.TimeStamp <> SRC.TimeStamp OR TGT.ScartoManuale <> SRC.ScartoManuale OR TGT.KgScartoCesoia <> SRC.KgScartoCesoia)
  THEN UPDATE SET TGT.TimeStamp = SRC.TimeStamp, TGT.ScartoManuale = SRC.ScartoManuale, TGT.KgScartoCesoia = SRC.KgScartoCesoia
WHEN NOT MATCHED
  THEN INSERT VALUES (NumeroLotto, ID, TimeStamp, ScartoManuale, KgScartoCesoia)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
	CURRENT_TIMESTAMP AS merge_datetime,
	$action AS merge_action,
	'RRDP.ScartiCesoia_ScartiCesoia' AS full_olap_table_name,
	'NumeroLotto = ' + CAST(COALESCE(inserted.NumeroLotto, deleted.NumeroLotto) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

