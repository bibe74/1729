
CREATE PROCEDURE MRDP.usp_Create_LogSummaryTable_MonitoraggioLog
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDP.LogSummaryTable_MonitoraggioLog (
    -- Chiavi
    PressID        CHAR(3) NOT NULL,
    ShiftDate        DATE NOT NULL,
    ShiftID        VARCHAR(2) NOT NULL,

    -- Dimensioni
    LogCount        INT,
    LogQrCodeReadCount        INT,
    LogQrCodeMissCount        INT,
    LogKg        DECIMAL(28, 12),
    LogBillKg        DECIMAL(28, 12),
    LogBillCount        INT,
    MinLogKgDeviationPerc        DECIMAL(28, 12),
    MaxLogKgDeviationPerc        DECIMAL(28, 12),
    AvgLogKgDeviationPerc        DECIMAL(28, 12),
    LogKgDeviationCountTh0        INT,
    LogKgDeviationCountTh1        INT,
    LogKgDeviationCountTh2        INT,
    MinLogBillKgDeviationPerc        DECIMAL(28, 12),
    MaxLogBillKgDeviationPerc        DECIMAL(28, 12),
    AvgLogBillKgDeviationPerc        DECIMAL(28, 12),
    LogBillKgDeviationCountTh0        INT,
    LogBillKgDeviationCountTh1        INT,
    LogBillKgDeviationCountTh2        INT


    -- Constraint
    CONSTRAINT PK_LogSummaryTable_MonitoraggioLog PRIMARY KEY CLUSTERED (
        PressID,
        ShiftDate,
        ShiftID
    )
);

END;
GO

