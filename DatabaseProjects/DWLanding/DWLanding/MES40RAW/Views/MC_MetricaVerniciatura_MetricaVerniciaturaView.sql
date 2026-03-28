
CREATE VIEW MES40RAW.MC_MetricaVerniciatura_MetricaVerniciaturaView
AS
SELECT
    -- Chiavi
    IDMetricaVerniciatura,        -- IDMetricaVerniciatura

    -- Dimensioni
    DistanzaPercorsa,        -- DistanzaPercorsa
    Fine,        -- DataOraFine
    COALESCE(Finitura, N'') AS Finitura,        -- IDFinitura
    Inizio,        -- DataOraInizio
    COALESCE(Lotto, N'') AS Lotto,        -- NumeroLotto
    TempoFermo,        -- MinutiFermo
    TempoTrascorso,        -- MinutiTrascorsi
    TempoTrasportatoreMin1_4        -- MinutiTrasportatoreMin1_4

FROM [SQL2014\SCADA2014].MES40_RAW.Painting.MC_MetricaVerniciatura;
GO

