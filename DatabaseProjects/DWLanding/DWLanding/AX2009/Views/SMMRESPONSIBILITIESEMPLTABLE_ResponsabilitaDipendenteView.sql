
CREATE VIEW AX2009.SMMRESPONSIBILITIESEMPLTABLE_ResponsabilitaDipendenteView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    EMPLID,        -- IDDipendente
    RESPONSIBILITYID,        -- IDResponsabilita
    REFTABLEID,        -- IDTabellaRiferimento
    REFRECID,        -- IDRecordRiferimento
    RECID        -- PKResponsabilitaDipendente

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.SMMRESPONSIBILITIESEMPLTABLE;
GO

