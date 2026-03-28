CREATE TABLE [MES40MSPA].[BilletSummaryTable_MonitoraggioBillette] (
    [PressID]                 CHAR (3)    NOT NULL,
    [ShiftDate]               DATE        NOT NULL,
    [ShiftID]                 VARCHAR (2) NOT NULL,
    [BillCount]               INT         NULL,
    [StartTsNextBillErrCount] INT         NULL,
    [TsSequenceErrCount]      INT         NULL,
    [BillKgErrCount]          INT         NULL,
    [BillCastingIdErrCount]   INT         NULL
);
GO

ALTER TABLE [MES40MSPA].[BilletSummaryTable_MonitoraggioBillette]
    ADD CONSTRAINT [PK_BilletSummaryTable_MonitoraggioBillette] PRIMARY KEY CLUSTERED ([PressID] ASC, [ShiftDate] ASC, [ShiftID] ASC);
GO

