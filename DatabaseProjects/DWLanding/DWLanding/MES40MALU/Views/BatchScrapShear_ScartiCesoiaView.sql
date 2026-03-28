
CREATE VIEW MES40MALU.BatchScrapShear_ScartiCesoiaView
AS
SELECT
    -- Chiavi
    BatchScrapShearID,        -- IDScartiCesoia

    -- Dimensioni
    Ts,        -- TimeStamp
    BatchID COLLATE DATABASE_DEFAULT AS BatchID,        -- NumeroLotto
    KgScrapShear,        -- KgScartoCesoia
    IsManualScrap        -- ScartoManuale

FROM [192.168.216.247\SCADA2017].MES40_RDP.Press.BatchScrapShear;
GO

