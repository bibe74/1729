CREATE TABLE [AX2009].[NPOWORKCALENDARDATELINE_DataLavorativa_Turno] (
    [DATAAREAID]   CHAR (4)                                    NOT NULL,
    [TRANSDATE]    DATE                                        NOT NULL,
    [CALENDARID]   NVARCHAR (10)                               NOT NULL,
    [SHIFTID]      NVARCHAR (2)                                NOT NULL,
    [RECID]        BIGINT                                      NOT NULL,
    [DURATION]     INT                                         NOT NULL,
    [FROMTIME]     INT                                         NOT NULL,
    [SysStartTime] DATETIME2 (0) GENERATED ALWAYS AS ROW START NOT NULL,
    [SysEndTime]   DATETIME2 (0) GENERATED ALWAYS AS ROW END   NOT NULL,
    PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[AX2009].[NPOWORKCALENDARDATELINE_DataLavorativa_Turno_History], DATA_CONSISTENCY_CHECK=ON));
GO

ALTER TABLE [AX2009].[NPOWORKCALENDARDATELINE_DataLavorativa_Turno]
    ADD CONSTRAINT [PK_NPOWORKCALENDARDATELINE_DataLavorativa_Turno] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC, [TRANSDATE] ASC, [CALENDARID] ASC, [SHIFTID] ASC) WITH (FILLFACTOR = 100);
GO

