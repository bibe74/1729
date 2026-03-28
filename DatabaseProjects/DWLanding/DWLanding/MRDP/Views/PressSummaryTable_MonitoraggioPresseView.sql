
CREATE VIEW MRDP.PressSummaryTable_MonitoraggioPresseView
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

FROM [SQL2014\SCADA2014].RaccoltaDatiProduzione.BI.PressSummaryTable;
GO

