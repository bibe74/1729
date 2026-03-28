
CREATE VIEW RRDP.FermiMacchina_FermiMacchinaView
AS
SELECT
    FM.ID AS BatchDowntimeID,
    FM.MES40_RAW_IDFermoMacchina AS BatchDowntimeRawID,
    FM.IDPressa AS PressID,
    FM.IDCausaleFermoMacchina AS DowntimeReasonID,
    FM.NumeroFermo AS DowntimeCode,
    FM.StartFermo AS StartTs,
    FM.StopFermo AS StopTs,
    CAST(1 AS INT) AS DowntimeType, -- 0: Microfermo, 1: Macrofermo
    FM.TipoGuasto AS FailureType,
    FM.Elab_Stato AS EditStatusID,
    COALESCE(CFM.Descrizione, N'<???>') AS DowntimeReasonDescription,
	N'Macrofermo' AS DowntimeTypeDescription,
	COALESCE(TG.Descrizione, N'<???>') AS FailureTypeDescription,
    0 AS MicroDowntimeType,
    0 AS MicroDowntimeDuration

FROM [SQL2014MRAG\SCADA2014].RaccoltaDatiProduzione.dbo.FermiMacchina FM
LEFT JOIN [SQL2014MRAG\SCADA2014].RaccoltaDatiProduzione.dbo.CausaliFermoMacchina CFM ON CFM.ID = FM.IDCausaleFermoMacchina
LEFT JOIN [SQL2014MRAG\SCADA2014].RaccoltaDatiProduzione.dbo.FermiMacchina_TipiGuasto TG ON TG.ID = FM.TipoGuasto
WHERE FM.StartFermo >= CAST('20201201' AS DATETIME)

UNION ALL

SELECT
    FMM.ID AS BatchDowntimeID,
    FMM.MES40_RAW_IDFermoMacchina AS BatchDowntimeRawID,
    FMM.IDPressa AS PressID,
    FMM.IDCausaleMicroFermoMacchina AS DowntimeReasonID,
    CONCAT(FMM.IDPressa, FORMAT(FMM.StartFermo, 'yyMMddHHmmss')) AS DowntimeCode,
    FMM.StartFermo AS StartTs,
    DATEADD(MILLISECOND, FMM.DurataFermo, FMM.StartFermo) AS StopTs,
    CAST(0 AS INT) AS DowntimeType, -- 0: Microfermo, 1: Macrofermo
    CAST(4 AS INT) AS FailureType, -- 4: Microfermo
    NULL AS EditStatusID,
    COALESCE(CFMM.Descrizione, N'<???>') AS DowntimeReasonDescription,
	N'Microfermo' AS DowntimeTypeDescription,
	N'Microfermo' AS FailureTypeDescription,
    FMM.IDTipoMicroFermoMacchina AS MicroDowntimeType,
    FMM.DurataFermo AS MicroDowntimeDuration

FROM [SQL2014MRAG\SCADA2014].RaccoltaDatiProduzione.dbo.FermiMacchina_Micro FMM
LEFT JOIN [SQL2014MRAG\SCADA2014].RaccoltaDatiProduzione.dbo.CausaliMicrofermoMacchina CFMM ON CFMM.ID = FMM.IDCausaleMicroFermoMacchina
WHERE FMM.StartFermo >= CAST('20201201' AS DATETIME);
GO

