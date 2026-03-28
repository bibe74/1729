
CREATE VIEW MES40IMET.BatchDowntime_FermiMacchinaView
AS
SELECT
    -- Chiavi
    BD.BatchDowntimeID,        -- IDFermiMacchina

    -- Dimensioni
    BD.PressID COLLATE DATABASE_DEFAULT AS PressID,        -- IDPressa
    BD.DowntimeReasonID,        -- IDCausaleFermoMacchina
    BD.DowntimeCode COLLATE DATABASE_DEFAULT AS DowntimeCode,        -- NumeroFermo
    BD.StartTs,        -- StartFermo
    BD.StopTs,        -- StopFermo
    BD.FailureType        -- TipoGuasto

FROM [SQL2012IMET\SCADA2012].MES40_RDP.BI.vBatchDowntime BD;
GO

