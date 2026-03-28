
CREATE VIEW AX2009.ASSETTRANS_AmmortamentoCespitiView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    ASSETID,        -- IDCespite
    VOUCHER,        -- Giustificativo
    TRANSDATE,        -- DataTransazione
    RECID,        -- PKAmmortamentoCespiti

    -- Dimensioni
    TXT,        -- Descrizione
    DIMENSION,        -- IDAreaGeografica
    DIMENSION2_,        -- IDProdottoVendita
    DIMENSION3_,        -- IDProdottoAcquisto
    TRANSTYPE,        -- IDTipoTransazioneCespite [enum AssetTransType]
    ASSETGROUP,        -- GruppoCespiti
    DIMENSION4_,        -- IDFaseDiGruppo
    DIMENSION5_,        -- IDInfragruppo
    DIMENSION6_,        -- IDMacroArea

    -- Misure
    CURRENCYCODE,        -- IDValuta
    AMOUNTCUR,        -- Importo
    AMOUNTMST        -- ImportoValutaMaster

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.ASSETTRANS;
GO

