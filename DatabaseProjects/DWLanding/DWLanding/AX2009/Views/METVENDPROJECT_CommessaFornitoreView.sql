
CREATE VIEW AX2009.METVENDPROJECT_CommessaFornitoreView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    VENDACCOUNT,        -- IDFornitore
    VENDPROJECTID,        -- IDCommessaFornitore
    RECID,        -- PKCommessaFornitore

    -- Dimensioni
    ENABLECUSTPROJECT,        -- IsCommessaClienteAbilitata
    DOCUMENTDESCRIPTION,        -- Descrizione
    REQUESTDATE,        -- DataRichiesta
    CUSTACCOUNT,        -- IDCliente
    DATEEND,        -- DataFine
    DATESTART,        -- DataInizio
    SUPPLYTYPE,        -- IDTipoFornitura [enum METCoverageType]

    -- Misure
    UNITID,        -- IDUnitaDiMisura
    TOTALQTY,        -- QtaTotale
    CURRENCYCODE,        -- IDValuta
    METALCOVERPRICE,        -- PrezzoCoperturaMetallo
    PRICEUNIT,        -- UnitaDiPrezzo
    METCOVERAGETYPE        -- IDTipoCopertura [enum METCoverageType]

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.METVENDPROJECT;
GO

