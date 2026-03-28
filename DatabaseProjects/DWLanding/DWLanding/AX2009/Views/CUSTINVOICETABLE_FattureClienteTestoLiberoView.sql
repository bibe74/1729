
CREATE VIEW AX2009.CUSTINVOICETABLE_FattureClienteTestoLiberoView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    INVOICEDATE,        -- DataFattura
    INVOICEID,        -- NumeroFattura
    NUMBERSEQUENCEGROUP,        -- GruppoSequenzeNumeriche
    RECID,        -- PKFattureClienteTestoLibero

    -- Dimensioni
    DLVCOUNTRYREGIONID        -- IDNazioneConsegna

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.CUSTINVOICETABLE
WHERE INVOICEID <> N'';
GO

