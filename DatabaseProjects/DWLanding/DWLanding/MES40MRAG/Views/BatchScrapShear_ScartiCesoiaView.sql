
CREATE VIEW MES40MRAG.BatchScrapShear_ScartiCesoiaView
AS
SELECT
    -- Chiavi
    BatchScrapShearID,        -- IDScartiCesoia

    -- Dimensioni
    Ts,        -- TimeStamp
    BatchID COLLATE DATABASE_DEFAULT AS BatchID,        -- NumeroLotto
    KgScrapShear,        -- KgScartoCesoia
    IsManualScrap        -- ScartoManuale

FROM [SQL2014MRAG\SCADA2014].MES40_RDP.Press.BatchScrapShear;
GO

