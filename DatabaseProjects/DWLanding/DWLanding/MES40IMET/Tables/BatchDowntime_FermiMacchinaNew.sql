CREATE TABLE [MES40IMET].[BatchDowntime_FermiMacchinaNew] (
    [PKBatchDowntime]       BIGINT   NOT NULL,
    [DowntimeType]          TINYINT  NOT NULL,
    [PressID]               CHAR (3) NOT NULL,
    [DataTurno]             DATE     NOT NULL,
    [IDTurno]               SMALLINT NOT NULL,
    [Turno]                 CHAR (2) NOT NULL,
    [DowntimeReasonID]      SMALLINT NULL,
    [MicroDowntimeReasonID] SMALLINT NULL,
    [IsGuasto]              BIT      NOT NULL,
    [IsInceppamento]        BIT      NOT NULL,
    [DurataSecondi]         INT      NOT NULL,
    [NumeroFermi]           INT      NOT NULL
);
GO

ALTER TABLE [MES40IMET].[BatchDowntime_FermiMacchinaNew]
    ADD CONSTRAINT [PK_BatchDowntime_FermiMacchinaNew] PRIMARY KEY CLUSTERED ([PKBatchDowntime] ASC);
GO

