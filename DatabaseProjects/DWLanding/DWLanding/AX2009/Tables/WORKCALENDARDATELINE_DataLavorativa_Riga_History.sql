CREATE TABLE [AX2009].[WORKCALENDARDATELINE_DataLavorativa_Riga_History] (
    [DATAAREAID]                CHAR (4)      NOT NULL,
    [TRANSDATE]                 DATETIME      NOT NULL,
    [CALENDARID]                NVARCHAR (10) NOT NULL,
    [FROMTIME]                  INT           NOT NULL,
    [RECID]                     BIGINT        NOT NULL,
    [TOTIME]                    INT           NOT NULL,
    [NPOWORKCALENDARDATELINEID] BIGINT        NOT NULL,
    [SysStartTime]              DATETIME2 (0) NOT NULL,
    [SysEndTime]                DATETIME2 (0) NOT NULL
);
GO

CREATE STATISTICS [SysStartTime]
    ON [AX2009].[WORKCALENDARDATELINE_DataLavorativa_Riga_History]([SysStartTime]);
GO

CREATE CLUSTERED INDEX [ix_WORKCALENDARDATELINE_DataLavorativa_Riga_History]
    ON [AX2009].[WORKCALENDARDATELINE_DataLavorativa_Riga_History]([SysEndTime] ASC, [SysStartTime] ASC) WITH (FILLFACTOR = 100, DATA_COMPRESSION = PAGE);
GO

