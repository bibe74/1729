CREATE TABLE [AX2009].[NPOWORKCALENDARDATELINE_DataLavorativa_Turno_History] (
    [DATAAREAID]   CHAR (4)      NOT NULL,
    [TRANSDATE]    DATE          NOT NULL,
    [CALENDARID]   NVARCHAR (10) NOT NULL,
    [SHIFTID]      NVARCHAR (2)  NOT NULL,
    [RECID]        BIGINT        NOT NULL,
    [DURATION]     INT           NOT NULL,
    [FROMTIME]     INT           NOT NULL,
    [SysStartTime] DATETIME2 (0) NOT NULL,
    [SysEndTime]   DATETIME2 (0) NOT NULL
);
GO

CREATE CLUSTERED INDEX [ix_NPOWORKCALENDARDATELINE_DataLavorativa_Turno_History]
    ON [AX2009].[NPOWORKCALENDARDATELINE_DataLavorativa_Turno_History]([SysEndTime] ASC, [SysStartTime] ASC) WITH (FILLFACTOR = 100, DATA_COMPRESSION = PAGE);
GO

