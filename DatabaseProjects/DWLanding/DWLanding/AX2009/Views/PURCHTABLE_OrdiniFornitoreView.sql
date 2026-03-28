
CREATE VIEW AX2009.PURCHTABLE_OrdiniFornitoreView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    PURCHID,        -- OrdineFornitore
    RECID,        -- PKOrdiniFornitore

    -- Dimensioni
    ORDERACCOUNT,        -- IDFornitore
    DELIVERYDATE,        -- DataConsegna
    INTERCOMPANYORIGINALSALESID,        -- OrdineClienteOriginario
    INTERCOMPANYORIGINALCUSTACCO12,        -- IDClienteOriginario
    INTERCOMPANYDIRECTDELIVERY,        -- IsConsegnaDirettaIntercompany
    PURCHSTATUS,        -- IDStatoOrdineFornitore [enum PurchStatus]
    PURCHASETYPE,        -- IDTipoAcquisto [enum PurchType]
    INTERCOMPANYORIGIN,        -- IDOrigineIntercompany [enum IntercompanyOrigin]
    DOCUMENTSTATUS,        -- IDStatoDocumento [enum DocumentStatus]
    PURCHPOOLID,        -- IDPoolAcquisti
    VENDORREF,        -- RiferimentoFornitore
    INTERCOMPANYCOMPANYID,        -- IDAziendaIntercompany
    INTERCOMPANYSALESID,        -- OrdineClienteIntercompany
    INTERCOMPANYORDER,        -- IsOrdineIntercompany
    CREATEDDATETIME,        -- DataOraCreazione

    -- Misure
    CURRENCYCODE        -- IDValuta

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.PURCHTABLE;
GO

