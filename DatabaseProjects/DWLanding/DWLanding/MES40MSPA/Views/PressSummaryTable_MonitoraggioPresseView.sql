
CREATE VIEW MES40MSPA.PressSummaryTable_MonitoraggioPresseView
AS
SELECT
    -- Chiavi
    PressID,        -- IDPressa
    ShiftDate,        -- DataTurno
    ShiftID,        -- IDTurno

    -- Dimensioni
    DateStartTs,        -- DateStartTs
    DateEndTs,        -- DateEndTs
    ErpDuration,        -- ErpDuration
    ProdDuration,        -- ProdDuration
    DownDuration        -- DownDuration

FROM [SQL2014\SCADA2014].MES40_RDP.BI.PressSummaryTable;
GO

