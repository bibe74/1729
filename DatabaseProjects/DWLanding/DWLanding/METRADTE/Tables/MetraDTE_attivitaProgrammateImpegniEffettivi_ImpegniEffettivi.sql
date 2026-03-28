CREATE TABLE [METRADTE].[MetraDTE_attivitaProgrammateImpegniEffettivi_ImpegniEffettivi] (
    [ID]               BIGINT          NOT NULL,
    [IDScheda]         BIGINT          NULL,
    [impegnoEffettivo] DECIMAL (18, 2) NULL
);
GO

ALTER TABLE [METRADTE].[MetraDTE_attivitaProgrammateImpegniEffettivi_ImpegniEffettivi]
    ADD CONSTRAINT [PK_MetraDTE_attivitaProgrammateImpegniEffettivi_ImpegniEffettivi] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

