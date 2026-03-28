CREATE TABLE [MRDP].[FermiMacchina_FermiMacchina] (
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
    [FailureTypeDescription]    NVARCHAR (50)   NOT NULL,
    [MicroDowntimeType]         SMALLINT        NOT NULL,
    [MicroDowntimeDuration]     INT             NOT NULL
);
GO

ALTER TABLE [MRDP].[FermiMacchina_FermiMacchina]
    ADD CONSTRAINT [PK_FermiMacchina_FermiMacchina] PRIMARY KEY CLUSTERED ([BatchDowntimeID] ASC);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_MRDP_FermiMacchina_FermiMacchina_DowntimeType_BatchDowntimeID]
    ON [MRDP].[FermiMacchina_FermiMacchina]([DowntimeType] ASC, [BatchDowntimeID] ASC);
GO

