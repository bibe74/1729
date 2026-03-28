CREATE TABLE [MES40RAW].[MC_MetricaVerniciatura_MetricaVerniciatura] (
    [IDMetricaVerniciatura]    INT           NOT NULL,
    [DistanzaPercorsa]         REAL          NOT NULL,
    [Fine]                     DATETIME2 (7) NOT NULL,
    [Finitura]                 NVARCHAR (40) NOT NULL,
    [Inizio]                   DATETIME2 (7) NOT NULL,
    [Lotto]                    NVARCHAR (40) NOT NULL,
    [TempoFermo]               REAL          NOT NULL,
    [TempoTrascorso]           REAL          NOT NULL,
    [TempoTrasportatoreMin1_4] REAL          NOT NULL
);
GO

ALTER TABLE [MES40RAW].[MC_MetricaVerniciatura_MetricaVerniciatura]
    ADD CONSTRAINT [PK_MC_MetricaVerniciatura_MetricaVerniciatura] PRIMARY KEY CLUSTERED ([IDMetricaVerniciatura] ASC);
GO

