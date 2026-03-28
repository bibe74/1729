
CREATE PROCEDURE RRDP.usp_AddIndexes_DataTurno_DataTurno
AS
BEGIN
SET NOCOUNT ON;

CREATE NONCLUSTERED INDEX IX_RRDP_DataTurno_DataTurno_DateTimeStart_DateTimeEnd_INCLUDE ON RRDP.DataTurno_DataTurno (DateTimeStart,DateTimeEnd) INCLUDE (PKData,IDTurno,Turno);

END;
GO

