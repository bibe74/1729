CREATE VIEW AX2009.CUSTTABLE_ClienteView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- PKAzienda
    ACCOUNTNUM,        -- IDCliente
    RECID,        -- PKCliente

    -- Dimensioni
    NAME,        -- Cliente
    CUSTGROUP,        -- IDClienteGruppo
    LINEDISC,        -- IDClienteGruppoScontoRiga
    PAYMTERMID,        -- IDTerminiPagamento
    CASHDISC,        -- IDScontoCassa
    SALESGROUP,        -- IDGruppoVendite
    BLOCKED,        -- Bloccato [enum CustVendorBlocked]
    VATNUM,        -- PartitaIVA
    COUNTRYREGIONID,        -- IDNazione
    STATE,        -- IDRegione
    COUNTY,        -- IDProvincia
    STATISTICSGROUP,        -- IDClienteGruppoStatistiche
    PAYMMODE,        -- IDMetodoPagamento
    SALESPOOLID,        -- IDPoolVendite
    CITY,        -- Citta
    FISCALCODE,        -- CodiceFiscale
    CUSTCLASSIFICATIONID,        -- IDClienteGruppoClassificazione
    PARTYTYPE,        -- IDTipoRubrica [enum DirPartyType]
    PARTYID,        -- IDRubrica
    SALESDISTRICTID,        -- IDZonaDiVendita
    SEGMENTID,        -- IDSegmento
    SUBSEGMENTID,        -- IDSottosegmento
    MAINCONTACTID,        -- IDContattoPrincipale
    NPOCUSTGROUPID,        -- IDClienteGruppoFido

    -- Misure
    CAST(CREATEDDATETIME AS DATE) AS CreatedDate        -- DataCreazione

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.CUSTTABLE;
GO

