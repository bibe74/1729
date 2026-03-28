
CREATE PROCEDURE MRDP.usp_Create_BatchSummaryTable_MonitoraggioLotti
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDP.BatchSummaryTable_MonitoraggioLotti (
    -- Chiavi
    PressID        CHAR(3) NOT NULL,
    ShiftDate        DATE NOT NULL,
    ShiftID        VARCHAR(2) NOT NULL,

    -- Dimensioni
    BatchCount        INT,
    MinItemMeterWeightDeviationPerc        DECIMAL(28, 12),
    MaxItemMeterWeightDeviationPerc        DECIMAL(28, 12),
    AvgItemMeterWeightDeviationPerc        DECIMAL(28, 12),
    ItemMeterWeightDeviationCountTh0        INT,
    ItemMeterWeightDeviationCountTh1        INT,
    ItemMeterWeightDeviationCountTh2        INT,
    ItemMeterWeightMesMissCount        INT,
    ItemMeterWeightTestMissCount        INT


    -- Constraint
    CONSTRAINT PK_BatchSummaryTable_MonitoraggioLotti PRIMARY KEY CLUSTERED (
        PressID,
        ShiftDate,
        ShiftID
    )
);

END;
GO

