
CREATE VIEW MES40MSPA.ModuleTransSaw_DatiIncestamentoView
AS
SELECT
    -- Chiavi
    ModuleTransID,        -- IDDatiIncestamento

    -- Dimensioni
    CreatedTs,        -- Datetime2
    BarLength,      -- LunghezzaTagliata
    BatchID,        -- NumeroLotto
    Qty        -- Qta

FROM [SQL2014\SCADA2014].MES40_RDP.BI.vModuleTransSaw;
GO

