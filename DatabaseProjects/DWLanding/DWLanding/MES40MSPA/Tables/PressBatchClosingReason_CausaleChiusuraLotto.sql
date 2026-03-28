CREATE TABLE [MES40MSPA].[PressBatchClosingReason_CausaleChiusuraLotto] (
    [PressBatchClosingReasonID] SMALLINT      NOT NULL,
    [Description]               NVARCHAR (50) NOT NULL,
    [Result]                    NVARCHAR (50) NOT NULL
);
GO

ALTER TABLE [MES40MSPA].[PressBatchClosingReason_CausaleChiusuraLotto]
    ADD CONSTRAINT [PK_PressBatchClosingReason_CausaleChiusuraLotto] PRIMARY KEY CLUSTERED ([PressBatchClosingReasonID] ASC);
GO

