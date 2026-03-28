
CREATE VIEW MES40IMET.BatchDowntime_FermiMacchinaNewView
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

FROM [SQL2012IMET\SCADA2012].MES40_RDP.BI.BatchDowntime BD;
GO

