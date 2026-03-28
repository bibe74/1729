CREATE TABLE [MES40ALMA].[BatchDowntime_FermiMacchina] (
    [BatchDowntimeID]           INT             NOT NULL,
    [PressID]                   CHAR (3)        NOT NULL,
    [DowntimeReasonID]          SMALLINT        NOT NULL,
    [DowntimeCode]              NVARCHAR (4000) NOT NULL,
    [StartTs]                   DATETIME        NOT NULL,
    [StopTs]                    DATETIME        NOT NULL,
    [DowntimeType]              TINYINT         NOT NULL,
    [FailureType]               TINYINT         NOT NULL,
    [DowntimeReasonDescription] NVARCHAR (50)   NOT NULL,
    [DowntimeTypeDescription]   NVARCHAR (50)   NOT NULL,
    [FailureTypeDescription]    NVARCHAR (50)   NOT NULL
);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_MES40ALMA_BatchDowntime_FermiMacchina_DowntimeType_BatchDowntimeID]
    ON [MES40ALMA].[BatchDowntime_FermiMacchina]([DowntimeType] ASC, [BatchDowntimeID] ASC);
GO

ALTER TABLE [MES40ALMA].[BatchDowntime_FermiMacchina]
    ADD CONSTRAINT [PK_BatchDowntime_FermiMacchina] PRIMARY KEY CLUSTERED ([BatchDowntimeID] ASC);
GO

