
CREATE PROCEDURE IRDP.usp_AddIndexes_DataTurno_DataTurno
AS
BEGIN
SET NOCOUNT ON;

CREATE NONCLUSTERED INDEX IX_IRDP_DataTurno_DataTurno_DateTimeStart_DateTimeEnd_INCLUDE ON IRDP.DataTurno_DataTurno (DateTimeStart,DateTimeEnd) INCLUDE (PKData,IDTurno,Turno);

END;
GO

