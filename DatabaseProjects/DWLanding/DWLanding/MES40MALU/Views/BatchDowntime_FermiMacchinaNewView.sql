
CREATE VIEW MES40MALU.BatchDowntime_FermiMacchinaNewView
AS
SELECT
    -- Chiavi
    BD.PKBatchDowntime,        -- IDFermiMacchina

    -- Dimensioni
    BD.DowntimeType,
    BD.PressID COLLATE DATABASE_DEFAULT AS PressID,        -- IDPressa
    BD.DataTurno,
    BD.IDTurno,
    BD.Turno,
    BD.DowntimeReasonID,
    BD.MicroDowntimeReasonID,
    BD.IsGuasto,
    BD.IsInceppamento,
    BD.DurataSecondi,
    BD.NumeroFermi

FROM [192.168.216.247\SCADA2017].MES40_RDP.BI.BatchDowntime BD;
GO

