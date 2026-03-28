
CREATE PROCEDURE MES40RAW.usp_Merge_MC_MetricaVerniciatura_MetricaVerniciatura
AS
BEGIN
SET NOCOUNT ON;

IF OBJECT_ID(N'MES40RAW.MC_MetricaVerniciatura_MetricaVerniciatura', N'U') IS NULL
BEGIN
    EXEC MES40RAW.usp_Create_MC_MetricaVerniciatura_MetricaVerniciatura;
    EXEC MES40RAW.usp_AddIndexes_MC_MetricaVerniciatura_MetricaVerniciatura;
END;

MERGE INTO MES40RAW.MC_MetricaVerniciatura_MetricaVerniciatura AS TGT
USING MES40RAW.MC_MetricaVerniciatura_MetricaVerniciaturaView (nolock) AS SRC
ON SRC.IDMetricaVerniciatura = TGT.IDMetricaVerniciatura
WHEN MATCHED AND (TGT.DistanzaPercorsa <> SRC.DistanzaPercorsa OR TGT.Fine <> SRC.Fine OR TGT.Finitura <> SRC.Finitura OR TGT.Inizio <> SRC.Inizio OR TGT.Lotto <> SRC.Lotto OR TGT.TempoFermo <> SRC.TempoFermo OR TGT.TempoTrascorso <> SRC.TempoTrascorso OR TGT.TempoTrasportatoreMin1_4 <> SRC.TempoTrasportatoreMin1_4)
  THEN UPDATE SET TGT.DistanzaPercorsa = SRC.DistanzaPercorsa, TGT.Fine = SRC.Fine, TGT.Finitura = SRC.Finitura, TGT.Inizio = SRC.Inizio, TGT.Lotto = SRC.Lotto, TGT.TempoFermo = SRC.TempoFermo, TGT.TempoTrascorso = SRC.TempoTrascorso, TGT.TempoTrasportatoreMin1_4 = SRC.TempoTrasportatoreMin1_4
WHEN NOT MATCHED
  THEN INSERT VALUES (IDMetricaVerniciatura, DistanzaPercorsa, Fine, Finitura, Inizio, Lotto, TempoFermo, TempoTrascorso, TempoTrasportatoreMin1_4)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE
OUTPUT
    CURRENT_TIMESTAMP AS merge_datetime,
    $action AS merge_action,
    'MES40RAW.MC_MetricaVerniciatura_MetricaVerniciatura' AS full_olap_table_name,
    'IDMetricaVerniciatura = ' + CAST(COALESCE(inserted.IDMetricaVerniciatura, deleted.IDMetricaVerniciatura) AS NVARCHAR) AS primary_key_description
INTO audit.merge_log_details;

END;
GO

