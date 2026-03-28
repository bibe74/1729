
CREATE PROCEDURE MES40MALU.usp_Create_PressDowntimeReason_CausaleFermoMacchina
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MES40MALU.PressDowntimeReason_CausaleFermoMacchina (
    -- Chiavi
    PressDowntimeReasonID        SMALLINT NOT NULL,

    -- Dimensioni
    Description        NVARCHAR(50) NOT NULL,
    OeeCLass        INT NOT NULL,
    AvailabilityClass        INT NOT NULL,
    IsActive        BIT NOT NULL,
    IsPressUnavailable  BIT NOT NULL,


    -- Constraint
    CONSTRAINT PK_PressDowntimeReason_CausaleFermoMacchina PRIMARY KEY CLUSTERED (
        PressDowntimeReasonID
    )
);

END;
GO

