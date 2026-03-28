CREATE TABLE [AX2009].[WORKCALENDARDATELINE_DataLavorativa_Riga] (
    [DATAAREAID]                CHAR (4)                                    NOT NULL,
    [TRANSDATE]                 DATETIME                                    NOT NULL,
    [CALENDARID]                NVARCHAR (10)                               NOT NULL,
    [FROMTIME]                  INT                                         NOT NULL,
    [RECID]                     BIGINT                                      NOT NULL,
    [TOTIME]                    INT                                         NOT NULL,
    [NPOWORKCALENDARDATELINEID] BIGINT                                      NOT NULL,
    [SysStartTime]              DATETIME2 (0) GENERATED ALWAYS AS ROW START NOT NULL,
    [SysEndTime]                DATETIME2 (0) GENERATED ALWAYS AS ROW END   NOT NULL,
    PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[AX2009].[WORKCALENDARDATELINE_DataLavorativa_Riga_History], DATA_CONSISTENCY_CHECK=ON));
GO

ALTER TABLE [AX2009].[WORKCALENDARDATELINE_DataLavorativa_Riga]
    ADD CONSTRAINT [PK_WORKCALENDARDATELINE_DataLavorativa_Riga] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC, [TRANSDATE] ASC, [CALENDARID] ASC, [FROMTIME] ASC);
GO

