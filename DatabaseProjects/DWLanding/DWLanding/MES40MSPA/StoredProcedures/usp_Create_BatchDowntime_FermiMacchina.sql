
CREATE PROCEDURE MES40MSPA.usp_Create_BatchDowntime_FermiMacchina
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MES40MSPA.BatchDowntime_FermiMacchina (
    -- Chiavi
    BatchDowntimeID        INT NOT NULL,

    -- Dimensioni
    PressID        CHAR(3) NOT NULL,
    DowntimeReasonID        SMALLINT NOT NULL,
    DowntimeCode        NVARCHAR(4000) NOT NULL,
    StartTs        DATETIME NOT NULL,
    StopTs        DATETIME NOT NULL,
    FailureType        TINYINT NOT NULL


    -- Constraint
    CONSTRAINT PK_BatchDowntime_FermiMacchina PRIMARY KEY CLUSTERED (
        BatchDowntimeID
    )
);

END;
GO

