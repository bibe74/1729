
CREATE VIEW AX2009.ADDRESSCOUNTRYREGION_NazioneView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    COUNTRYREGIONID,        -- IDNazione
    RECID,        -- PKNazione

    -- Dimensioni
    TYPE,        -- IDTipoNazione [enum CountryRegionType]
    ISOCODE,        -- CodiceISO
    NAME        -- Nazione

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.ADDRESSCOUNTRYREGION;
GO

