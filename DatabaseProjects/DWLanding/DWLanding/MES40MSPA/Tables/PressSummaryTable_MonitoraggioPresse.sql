CREATE TABLE [MES40MSPA].[PressSummaryTable_MonitoraggioPresse] (
    [PressID]      CHAR (3)    NOT NULL,
    [ShiftDate]    DATE        NOT NULL,
    [ShiftID]      VARCHAR (2) NOT NULL,
    [DateStartTs]  DATETIME    NULL,
    [DateEndTs]    DATETIME    NULL,
    [ErpDuration]  INT         NULL,
    [ProdDuration] INT         NULL,
    [DownDuration] INT         NULL
);
GO

ALTER TABLE [MES40MSPA].[PressSummaryTable_MonitoraggioPresse]
    ADD CONSTRAINT [PK_PressSummaryTable_MonitoraggioPresse] PRIMARY KEY CLUSTERED ([PressID] ASC, [ShiftDate] ASC, [ShiftID] ASC);
GO

