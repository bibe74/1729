
CREATE VIEW MRDP.BilletSummaryTable_MonitoraggioBilletteView
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

FROM [SQL2014\SCADA2014].RaccoltaDatiProduzione.BI.BilletSummaryTable;
GO

