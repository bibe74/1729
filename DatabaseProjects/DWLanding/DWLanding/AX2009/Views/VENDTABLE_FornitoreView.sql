CREATE VIEW AX2009.VENDTABLE_FornitoreView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    ACCOUNTNUM,        -- IDFornitore
    RECID,        -- PKFornitore

    -- Dimensioni
    NAME,        -- Fornitore
    VENDGROUP,        -- IDGruppoFornitore
    PAYMTERMID,        -- IDTerminiPagamento
    CUSTACCOUNT,        -- IDCliente
    VATNUM,        -- PartitaIVA
    PAYMMODE,        -- IDMetodoPagamento
    PURCHPOOLID,        -- IDPoolAcquisti
    FISCALCODE,        -- CodiceFiscale
    PARTYID,        -- IDRubrica
    PARTYTYPE,        -- IDTipoRubrica [enum DirPartyType]
    FDY_DOCF_VOCEFINANZIARIA        -- VoceFinanziaria

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.VENDTABLE;
GO

