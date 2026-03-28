CREATE TABLE [MES40MALU].[PressDowntimeReason_CausaleFermoMacchina] (
    [PressDowntimeReasonID] SMALLINT      NOT NULL,
    [Description]           NVARCHAR (50) NOT NULL,
    [OeeCLass]              INT           NOT NULL,
    [AvailabilityClass]     INT           NOT NULL,
    [IsActive]              BIT           NOT NULL,
    [IsPressUnavailable]    BIT           NOT NULL
);
GO

ALTER TABLE [MES40MALU].[PressDowntimeReason_CausaleFermoMacchina]
    ADD CONSTRAINT [PK_PressDowntimeReason_CausaleFermoMacchina] PRIMARY KEY CLUSTERED ([PressDowntimeReasonID] ASC);
GO

