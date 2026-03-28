
CREATE PROCEDURE MES40MSPA.usp_Create_BilletSummaryTable_MonitoraggioBillette
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MES40MSPA.BilletSummaryTable_MonitoraggioBillette (
    -- Chiavi
    PressID        CHAR(3) NOT NULL,
    ShiftDate        DATE NOT NULL,
    ShiftID        VARCHAR(2) NOT NULL,

    -- Dimensioni
    BillCount        INT,
    StartTsNextBillErrCount        INT,
    TsSequenceErrCount        INT,
    BillKgErrCount        INT,
    BillCastingIdErrCount        INT


    -- Constraint
    CONSTRAINT PK_BilletSummaryTable_MonitoraggioBillette PRIMARY KEY CLUSTERED (
        PressID,
        ShiftDate,
        ShiftID
    )
);

END;
GO

