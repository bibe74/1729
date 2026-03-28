CREATE TABLE [AX2009].[WORKCALENDARDATE_DataLavorativa] (
    [DATAAREAID]      CHAR (4)                                    NOT NULL,
    [TRANSDATE]       DATE                                        NOT NULL,
    [CALENDARID]      NVARCHAR (10)                               NOT NULL,
    [RECID]           BIGINT                                      NOT NULL,
    [WORKTIMECONTROL] SMALLINT                                    NOT NULL,
    [SysStartTime]    DATETIME2 (0) GENERATED ALWAYS AS ROW START NOT NULL,
    [SysEndTime]      DATETIME2 (0) GENERATED ALWAYS AS ROW END   NOT NULL,
    PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[AX2009].[WORKCALENDARDATE_DataLavorativa_History], DATA_CONSISTENCY_CHECK=ON));
GO

ALTER TABLE [AX2009].[WORKCALENDARDATE_DataLavorativa]
    ADD CONSTRAINT [PK_WORKCALENDARDATE_DataLavorativa] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC, [CALENDARID] ASC, [TRANSDATE] ASC) WITH (FILLFACTOR = 100);
GO

