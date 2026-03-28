
CREATE VIEW AXBETA.SRSANALYSISENUMS_EtichettaView
AS
SELECT
    -- Chiavi
    ENUMNAME,        -- NomeEtichetta
    ENUMITEMVALUE,        -- IDEtichetta
    LANGUAGEID,        -- IDLingua
    RECID,        -- PKEtichetta

    -- Dimensioni
    ENUMITEMLABEL        -- Etichetta

FROM [AXBETA\AXBETA].AX2009_METRA_BETA.dbo.SRSANALYSISENUMS;
GO

