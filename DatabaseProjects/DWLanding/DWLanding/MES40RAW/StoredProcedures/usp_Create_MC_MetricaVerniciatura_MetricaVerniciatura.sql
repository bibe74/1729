
CREATE PROCEDURE MES40RAW.usp_Create_MC_MetricaVerniciatura_MetricaVerniciatura
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MES40RAW.MC_MetricaVerniciatura_MetricaVerniciatura (
    -- Chiavi
    IDMetricaVerniciatura        INT NOT NULL,

    -- Dimensioni
    DistanzaPercorsa        REAL NOT NULL,
    Fine        DATETIME2 NOT NULL,
    Finitura        NVARCHAR(40) NOT NULL,
    Inizio        DATETIME2 NOT NULL,
    Lotto        NVARCHAR(40) NOT NULL,
    TempoFermo        REAL NOT NULL,
    TempoTrascorso        REAL NOT NULL,
    TempoTrasportatoreMin1_4        REAL NOT NULL,


    -- Constraint
    CONSTRAINT PK_MC_MetricaVerniciatura_MetricaVerniciatura PRIMARY KEY CLUSTERED (
        IDMetricaVerniciatura
    )
);

END;
GO

