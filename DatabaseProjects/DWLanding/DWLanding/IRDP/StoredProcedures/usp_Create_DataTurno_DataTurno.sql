
CREATE PROCEDURE IRDP.usp_Create_DataTurno_DataTurno
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE IRDP.DataTurno_DataTurno (
    -- Chiavi
    PKDataTurno        INT NOT NULL,

    -- Dimensioni
    PKData        DATE NOT NULL,
    IDTurno        TINYINT NOT NULL,
    Turno        CHAR(2) NOT NULL,
    DateTimeStart        DATETIME,
    DateTimeEnd        DATETIME


    -- Constraint
    CONSTRAINT PK_DataTurno_DataTurno PRIMARY KEY CLUSTERED (
        PKDataTurno
    )
);

END;
GO

