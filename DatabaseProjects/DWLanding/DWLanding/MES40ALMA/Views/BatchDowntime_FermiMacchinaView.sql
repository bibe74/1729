
CREATE VIEW MES40ALMA.BatchDowntime_FermiMacchinaView
AS
SELECT
    -- Chiavi
    BD.BatchDowntimeID,		-- IDFermiMacchina

    -- Dimensioni
    BD.PressID COLLATE DATABASE_DEFAULT AS PressID,		-- IDPressa
    BD.DowntimeReasonID,		-- IDCausaleFermoMacchina
    BD.DowntimeCode COLLATE DATABASE_DEFAULT AS DowntimeCode,		-- NumeroFermo
    BD.StartTs,		-- StartFermo
    BD.StopTs,		-- StopFermo
	BD.DowntimeType,		-- IDTipoFermo
    BD.FailureType,		-- IDTipoGuasto
	BD.DowntimeReasonDescription COLLATE DATABASE_DEFAULT AS DowntimeReasonDescription,		-- CausaleFermoMacchina
	BD.DowntimeTypeDescription COLLATE DATABASE_DEFAULT AS DowntimeTypeDescription,		-- TipoFermo
	BD.FailureTypeDescription COLLATE DATABASE_DEFAULT AS FailureTypeDescription		-- TipoGuasto

FROM [192.168.216.247\SCADA2017].ALMA_MES40_RDP.BI.vBatchDowntime BD;
GO

