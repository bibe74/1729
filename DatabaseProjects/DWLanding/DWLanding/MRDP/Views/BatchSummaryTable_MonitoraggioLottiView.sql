
CREATE VIEW MRDP.BatchSummaryTable_MonitoraggioLottiView
AS
SELECT
    -- Chiavi
    PressID,        -- IDPressa
    ShiftDate,        -- DataTurno
    ShiftID,        -- IDTurno

    -- Dimensioni
    BatchCount,        -- ConteggioLotti
    MinItemMeterWeightDeviationPerc,        -- MinItemMeterWeightDeviationPerc
    MaxItemMeterWeightDeviationPerc,        -- MaxItemMeterWeightDeviationPerc
    AvgItemMeterWeightDeviationPerc,        -- AvgItemMeterWeightDeviationPerc
    ItemMeterWeightDeviationCountTh0,        -- ItemMeterWeightDeviationCountTh0
    ItemMeterWeightDeviationCountTh1,        -- ItemMeterWeightDeviationCountTh1
    ItemMeterWeightDeviationCountTh2,        -- ItemMeterWeightDeviationCountTh2
    ItemMeterWeightMesMissCount,        -- ItemMeterWeightMesMissCount
    ItemMeterWeightTestMissCount        -- ItemMeterWeightTestMissCount

FROM [SQL2014\SCADA2014].RaccoltaDatiProduzione.BI.BatchSummaryTable;
GO

