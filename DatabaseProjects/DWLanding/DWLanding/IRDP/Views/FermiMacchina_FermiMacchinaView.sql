
CREATE VIEW IRDP.FermiMacchina_FermiMacchinaView
AS
SELECT
    FM.ID AS BatchDowntimeID,
    NULL AS BatchDowntimeRawID,
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
FROM 
    [SQL2012IMET\SCADA2012].MES40_RDP.History.FermiMacchina FM
    LEFT JOIN [SQL2012IMET\SCADA2012].MES40_RDP.History.CausaliFermoMacchina CFM ON CFM.ID = FM.IDCausaleFermoMacchina
    LEFT JOIN [SQL2012IMET\SCADA2012].MES40_RDP.History.FermiMacchina_TipiGuasto TG ON TG.ID = FM.TipoGuasto
WHERE 
    FM.StartFermo >= CAST('20201201' AS DATETIME)

UNION ALL

SELECT
    FMM.ID AS BatchDowntimeID,
    NULL AS BatchDowntimeRawID,
    FMM.IDPressa AS PressID,
    FMM.IDCausaleMicroFermoMacchina AS DowntimeReasonID,
    CONCAT(FMM.IDPressa, FORMAT(FMM.StartFermo, 'yyMMddHHmmss')) AS DowntimeCode,
    FMM.StartFermo AS StartTs,
    DATEADD(MILLISECOND, FMM.DurataFermo, FMM.StartFermo) AS StopTs,
    CAST(0 AS INT) AS DowntimeType, -- 0: Microfermo, 1: Macrofermo
    CAST(4 AS INT) AS FailureType, -- 4: Microfermo
    CAST(NULL AS CHAR(1)) AS EditStatusID,
    COALESCE(CFMM.Descrizione, N'<???>') AS DowntimeReasonDescription,
    N'Microfermo' AS DowntimeTypeDescription,
    N'Microfermo' AS FailureTypeDescription,
    0 AS MicroDowntimeType,
    FMM.DurataFermo AS MicroDowntimeDuration
FROM
    [SQL2012IMET\SCADA2012].MES40_RDP.History.FermiMacchina_Micro FMM
    LEFT JOIN [SQL2012IMET\SCADA2012].MES40_RDP.History.CausaliMicrofermoMacchina CFMM ON CFMM.ID = FMM.IDCausaleMicroFermoMacchina
WHERE
    FMM.StartFermo >= CAST('20201201' AS DATETIME)

UNION ALL

SELECT
    FM.IDFermoMacchina AS BatchDowntimeID,
    FM.IDFermoMacchina AS BatchDowntimeRawID,
    FM.IDPressa AS PressID,
    FM.IDCausaleFermoMacchina AS DowntimeReasonID,
    CONCAT(FM.IDPressa, FORMAT(FM.TsInizio, 'yyMMddHHmmss')) AS DowntimeCode,
    FM.TsInizio AS StartTs,
    FM.TsFine AS StopTs,
    FM.TipoFermo AS DowntimeType, -- 0: Microfermo, 1: Macrofermo
    FM.TipoGuasto AS FailureType,
    CAST(NULL AS CHAR(1)) AS EditStatusID,
    COALESCE(PDR.Description, N'<???>') AS DowntimeReasonDescription,
    CASE WHEN FM.TipoFermo = 0 THEN N'Microfermo' ELSE N'Macrofermo' END AS DowntimeTypeDescription,
    COALESCE(PFT.Description, N'<???>') AS FailureTypeDescription,
    0 AS MicroDowntimeType,
    FM.Durata AS MicroDowntimeDuration
FROM 
    [SQL2012IMET\SCADA2012].MES40_RAW.Pressa.FermiMacchina FM
    LEFT JOIN [SQL2012IMET\SCADA2012].MES40_RDP.MasterData.PressDowntimeReason PDR ON PDR.PressDowntimeReasonID = FM.IDCausaleFermoMacchina 
    LEFT JOIN [SQL2012IMET\SCADA2012].MES40_RDP.MasterData.PressFailureType PFT ON PFT.PressFailureTypeID = FM.TipoGuasto
WHERE 
    FM.TsInizio >= CAST('20210904' AS DATETIME);
GO

