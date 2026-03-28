
CREATE VIEW MES40MALU.BatchDieChanges_CambiMatriceView
AS
SELECT
    -- Chiavi
    BDC.BatchID COLLATE DATABASE_DEFAULT AS BatchID,        -- NumeroLotto

    -- Misure
    BDC.DieChangeSeconds        -- SecondiCambioMatrice

FROM [192.168.216.247\SCADA2017].MES40_RDP.BI.vBatchDieChanges BDC;
GO

