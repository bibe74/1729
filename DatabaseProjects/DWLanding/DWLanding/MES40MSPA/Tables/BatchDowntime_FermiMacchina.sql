CREATE TABLE [MES40MSPA].[BatchDowntime_FermiMacchina] (
    [BatchDowntimeID]  INT             NOT NULL,
    [PressID]          CHAR (3)        NOT NULL,
    [DowntimeReasonID] SMALLINT        NOT NULL,
    [DowntimeCode]     NVARCHAR (4000) NOT NULL,
    [StartTs]          DATETIME        NOT NULL,
    [StopTs]           DATETIME        NOT NULL,
    [FailureType]      TINYINT         NOT NULL
);
GO

ALTER TABLE [MES40MSPA].[BatchDowntime_FermiMacchina]
    ADD CONSTRAINT [PK_BatchDowntime_FermiMacchina] PRIMARY KEY CLUSTERED ([BatchDowntimeID] ASC);
GO

