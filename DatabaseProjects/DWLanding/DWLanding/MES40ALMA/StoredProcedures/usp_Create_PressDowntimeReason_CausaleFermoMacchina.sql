
CREATE PROCEDURE MES40ALMA.usp_Create_PressDowntimeReason_CausaleFermoMacchina
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MES40ALMA.PressDowntimeReason_CausaleFermoMacchina (
    -- Chiavi
    PressDowntimeReasonID        SMALLINT NOT NULL,

    -- Dimensioni
    Description        NVARCHAR(50) NOT NULL,
    OeeCLass        INT NOT NULL,
    AvailabilityClass        INT NOT NULL,
    IsActive        BIT NOT NULL


    -- Constraint
    CONSTRAINT PK_PressDowntimeReason_CausaleFermoMacchina PRIMARY KEY CLUSTERED (
        PressDowntimeReasonID
    )
);

END;
GO

