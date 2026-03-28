
CREATE PROCEDURE MES40MRAG.usp_Create_BatchDowntime_FermiMacchinaNew
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MES40MRAG.BatchDowntime_FermiMacchinaNew (
    -- Chiavi
    PKBatchDowntime        BIGINT NOT NULL,

    -- Dimensioni
    DowntimeType        TINYINT NOT NULL,
    PressID             CHAR(3) NOT NULL,
    DataTurno           DATE NOT NULL,
    IDTurno             SMALLINT NOT NULL,
    Turno               CHAR(2) NOT NULL,
    DowntimeReasonID    SMALLINT NULL,
    MicroDowntimeReasonID   SMALLINT NULL,
    IsGuasto            BIT NOT NULL,
    IsInceppamento      BIT NOT NULL,
    DurataSecondi       INT NOT NULL,
    NumeroFermi         INT NOT NULL,


    -- Constraint
    CONSTRAINT PK_BatchDowntime_FermiMacchinaNew PRIMARY KEY CLUSTERED (
        PKBatchDowntime
    )
);

END;
GO

