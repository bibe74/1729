CREATE PROCEDURE MRDP.usp_Create_FermiMacchina_FermiMacchina
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDP.FermiMacchina_FermiMacchina (
    -- Chiavi
    BatchDowntimeID        INT NOT NULL,

    -- Dimensioni
    PressID        CHAR(3) NOT NULL,
    DowntimeReasonID        SMALLINT NOT NULL,
    DowntimeCode        NVARCHAR(4000) NOT NULL,
    StartTs        DATETIME NOT NULL,
    StopTs        DATETIME NOT NULL,
	DowntimeType		TINYINT NOT NULL,
    FailureType        TINYINT NOT NULL,
	DowntimeReasonDescription		NVARCHAR(50) NOT NULL,
	DowntimeTypeDescription		NVARCHAR(50) NOT NULL,
	FailureTypeDescription		NVARCHAR(50) NOT NULL,
    MicroDowntimeType       SMALLINT NOT NULL,
    MicroDowntimeDuration       INT NOT NULL,

    -- Constraint
    CONSTRAINT PK_FermiMacchina_FermiMacchina PRIMARY KEY CLUSTERED (
        BatchDowntimeID
    )
);

END;
GO

