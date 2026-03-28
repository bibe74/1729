
CREATE PROCEDURE MES40MSPA.usp_Create_PressSummaryTable_MonitoraggioPresse
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MES40MSPA.PressSummaryTable_MonitoraggioPresse (
    -- Chiavi
    PressID        CHAR(3) NOT NULL,
    ShiftDate        DATE NOT NULL,
    ShiftID        VARCHAR(2) NOT NULL,

    -- Dimensioni
    DateStartTs        DATETIME,
    DateEndTs        DATETIME,
    ErpDuration        INT,
    ProdDuration        INT,
    DownDuration        INT


    -- Constraint
    CONSTRAINT PK_PressSummaryTable_MonitoraggioPresse PRIMARY KEY CLUSTERED (
        PressID,
        ShiftDate,
        ShiftID
    )
);

END;
GO

