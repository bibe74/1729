
CREATE VIEW MES40IMET.BatchScrapShear_ScartiCesoiaView
AS
SELECT
    -- Chiavi
    BatchScrapShearID,        -- IDScartiCesoia

    -- Dimensioni
    Ts,        -- TimeStamp
    BatchID COLLATE DATABASE_DEFAULT AS BatchID,        -- NumeroLotto
    KgScrapShear,        -- KgScartoCesoia
    IsManualScrap        -- ScartoManuale

FROM [SQL2012IMET\SCADA2012].MES40_RDP.Press.BatchScrapShear;
GO

