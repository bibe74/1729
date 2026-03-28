
CREATE VIEW AX2009.COMPANYINFO_InformazioniAziendaView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    RECID,        -- PKInformazioniAzienda

    -- Dimensioni
    NAME,        -- DescrizioneAzienda
    CURRENCYCODE        -- IDValutaMaster

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.COMPANYINFO;
GO

