
CREATE VIEW AX2009.INVENTITEMPURCHSETUP_ArticoloImpostazioniAcquistoView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- DATAAREAID
    ITEMID,        -- IDArticoloConfigurato
    RECID,        -- RECID

    -- Dimensioni
    INVENTDIMID,        -- IDDimensioneInventariale
    INVENTDIMIDDEFAULT,        -- IDDimensioneInventarialeDefault
    LEADTIME        -- LeadTime

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.INVENTITEMPURCHSETUP;
GO

