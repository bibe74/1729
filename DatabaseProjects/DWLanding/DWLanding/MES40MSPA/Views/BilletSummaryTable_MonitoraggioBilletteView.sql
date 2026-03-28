
CREATE VIEW MES40MSPA.BilletSummaryTable_MonitoraggioBilletteView
AS
SELECT
    -- Chiavi
    PressID,        -- IDPressa
    ShiftDate,        -- DataTurno
    ShiftID,        -- IDTurno

    -- Dimensioni
    BillCount,        -- ConteggioBillette
    StartTsNextBillErrCount,        -- StartTsNextBillErrCount
    TsSequenceErrCount,        -- TsSequenceErrCount
    BillKgErrCount,        -- BillKgErrCount
    BillCastingIdErrCount        -- BillCastingIdErrCount

FROM [SQL2014\SCADA2014].MES40_RDP.BI.BilletSummaryTable;
GO

