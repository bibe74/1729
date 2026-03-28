CREATE TABLE [MES40MSPA].[BatchSummaryTable_MonitoraggioLotti] (
    [PressID]                          CHAR (3)         NOT NULL,
    [ShiftDate]                        DATE             NOT NULL,
    [ShiftID]                          VARCHAR (2)      NOT NULL,
    [BatchCount]                       INT              NULL,
    [MinItemMeterWeightDeviationPerc]  DECIMAL (28, 12) NULL,
    [MaxItemMeterWeightDeviationPerc]  DECIMAL (28, 12) NULL,
    [AvgItemMeterWeightDeviationPerc]  DECIMAL (28, 12) NULL,
    [ItemMeterWeightDeviationCountTh0] INT              NULL,
    [ItemMeterWeightDeviationCountTh1] INT              NULL,
    [ItemMeterWeightDeviationCountTh2] INT              NULL,
    [ItemMeterWeightMesMissCount]      INT              NULL,
    [ItemMeterWeightTestMissCount]     INT              NULL
);
GO

ALTER TABLE [MES40MSPA].[BatchSummaryTable_MonitoraggioLotti]
    ADD CONSTRAINT [PK_BatchSummaryTable_MonitoraggioLotti] PRIMARY KEY CLUSTERED ([PressID] ASC, [ShiftDate] ASC, [ShiftID] ASC);
GO

