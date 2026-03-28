CREATE TABLE [AX2009].[WORKCALENDARDATE_DataLavorativa_History] (
    [DATAAREAID]      CHAR (4)      NOT NULL,
    [TRANSDATE]       DATE          NOT NULL,
    [CALENDARID]      NVARCHAR (10) NOT NULL,
    [RECID]           BIGINT        NOT NULL,
    [WORKTIMECONTROL] SMALLINT      NOT NULL,
    [SysStartTime]    DATETIME2 (0) NOT NULL,
    [SysEndTime]      DATETIME2 (0) NOT NULL
);
GO

CREATE STATISTICS [SysStartTime]
    ON [AX2009].[WORKCALENDARDATE_DataLavorativa_History]([SysStartTime]);
GO

CREATE CLUSTERED INDEX [ix_WORKCALENDARDATE_DataLavorativa_History]
    ON [AX2009].[WORKCALENDARDATE_DataLavorativa_History]([SysEndTime] ASC, [SysStartTime] ASC) WITH (FILLFACTOR = 100, DATA_COMPRESSION = PAGE);
GO

