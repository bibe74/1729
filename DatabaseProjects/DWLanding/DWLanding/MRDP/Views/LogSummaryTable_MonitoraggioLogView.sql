
CREATE VIEW MRDP.LogSummaryTable_MonitoraggioLogView
AS
SELECT
    -- Chiavi
    PressID,        -- IDPressa
    ShiftDate,        -- DataTurno
    ShiftID,        -- IDTurno

    -- Dimensioni
    LogCount,        -- ConteggioLog
    LogQrCodeReadCount,        -- LogQrCodeReadCount
    LogQrCodeMissCount,        -- LogQrCodeMissCount
    LogKg,        -- LogKg
    LogBillKg,        -- LogBillKg
    LogBillCount,        -- LogBillCount
    MinLogKgDeviationPerc,        -- MinLogKgDeviationPerc
    MaxLogKgDeviationPerc,        -- MaxLogKgDeviationPerc
    AvgLogKgDeviationPerc,        -- AvgLogKgDeviationPerc
    LogKgDeviationCountTh0,        -- LogKgDeviationCountTh0
    LogKgDeviationCountTh1,        -- LogKgDeviationCountTh1
    LogKgDeviationCountTh2,        -- LogKgDeviationCountTh2
    MinLogBillKgDeviationPerc,        -- MinLogBillKgDeviationPerc
    MaxLogBillKgDeviationPerc,        -- MaxLogBillKgDeviationPerc
    AvgLogBillKgDeviationPerc,        -- AvgLogBillKgDeviationPerc
    LogBillKgDeviationCountTh0,        -- LogBillKgDeviationCountTh0
    LogBillKgDeviationCountTh1,        -- LogBillKgDeviationCountTh1
    LogBillKgDeviationCountTh2        -- LogBillKgDeviationCountTh2

FROM [SQL2014\SCADA2014].RaccoltaDatiProduzione.BI.LogSummaryTable;
GO

