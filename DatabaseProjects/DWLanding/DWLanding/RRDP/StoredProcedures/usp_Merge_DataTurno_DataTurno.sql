
CREATE PROCEDURE RRDP.usp_Merge_DataTurno_DataTurno
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'RRDP.DataTurno_DataTurno', N'U') IS NULL
BEGIN
    EXEC RRDP.usp_Create_DataTurno_DataTurno;
    EXEC RRDP.usp_AddIndexes_DataTurno_DataTurno;
END;

MERGE INTO RRDP.DataTurno_DataTurno AS TGT
USING RRDP.DataTurno_DataTurnoView (nolock) AS SRC
ON SRC.PKDataTurno = TGT.PKDataTurno
WHEN MATCHED AND (TGT.PKData <> SRC.PKData OR TGT.IDTurno <> SRC.IDTurno OR TGT.Turno <> SRC.Turno OR TGT.DateTimeStart <> SRC.DateTimeStart OR TGT.DateTimeEnd <> SRC.DateTimeEnd)
  THEN UPDATE SET TGT.PKData = SRC.PKData, TGT.IDTurno = SRC.IDTurno, TGT.Turno = SRC.Turno, TGT.DateTimeStart = SRC.DateTimeStart, TGT.DateTimeEnd = SRC.DateTimeEnd
WHEN NOT MATCHED
  THEN INSERT VALUES (PKDataTurno, PKData, IDTurno, Turno, DateTimeStart, DateTimeEnd)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'RRDP.DataTurno_DataTurno' AS full_olap_table_name,
    'PKDataTurno = ' + CAST(COALESCE(inserted.PKDataTurno, deleted.PKDataTurno) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

