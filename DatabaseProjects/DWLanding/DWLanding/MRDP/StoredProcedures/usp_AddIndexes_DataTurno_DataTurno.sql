
CREATE PROCEDURE MRDP.usp_AddIndexes_DataTurno_DataTurno
AS
BEGIN
SET NOCOUNT ON;

CREATE NONCLUSTERED INDEX IX_MRDP_DataTurno_DataTurno_DateTimeStart_DateTimeEnd_INCLUDE ON MRDP.DataTurno_DataTurno (DateTimeStart,DateTimeEnd) INCLUDE (PKData,IDTurno,Turno);

END;
GO

