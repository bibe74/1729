CREATE TABLE [MES40MSPA].[LogSummaryTable_MonitoraggioLog] (
    [PressID]                    CHAR (3)         NOT NULL,
    [ShiftDate]                  DATE             NOT NULL,
    [ShiftID]                    VARCHAR (2)      NOT NULL,
    [LogCount]                   INT              NULL,
    [LogQrCodeReadCount]         INT              NULL,
    [LogQrCodeMissCount]         INT              NULL,
    [LogKg]                      DECIMAL (28, 12) NULL,
    [LogBillKg]                  DECIMAL (28, 12) NULL,
    [LogBillCount]               INT              NULL,
    [MinLogKgDeviationPerc]      DECIMAL (28, 12) NULL,
    [MaxLogKgDeviationPerc]      DECIMAL (28, 12) NULL,
    [AvgLogKgDeviationPerc]      DECIMAL (28, 12) NULL,
    [LogKgDeviationCountTh0]     INT              NULL,
    [LogKgDeviationCountTh1]     INT              NULL,
    [LogKgDeviationCountTh2]     INT              NULL,
    [MinLogBillKgDeviationPerc]  DECIMAL (28, 12) NULL,
    [MaxLogBillKgDeviationPerc]  DECIMAL (28, 12) NULL,
    [AvgLogBillKgDeviationPerc]  DECIMAL (28, 12) NULL,
    [LogBillKgDeviationCountTh0] INT              NULL,
    [LogBillKgDeviationCountTh1] INT              NULL,
    [LogBillKgDeviationCountTh2] INT              NULL
);
GO

ALTER TABLE [MES40MSPA].[LogSummaryTable_MonitoraggioLog]
    ADD CONSTRAINT [PK_LogSummaryTable_MonitoraggioLog] PRIMARY KEY CLUSTERED ([PressID] ASC, [ShiftDate] ASC, [ShiftID] ASC);
GO

