CREATE TABLE [AX2009].[PURCHTABLE_OrdiniFornitore] (
    [DATAAREAID]                     CHAR (4)      NOT NULL,
    [PURCHID]                        NVARCHAR (20) NOT NULL,
    [RECID]                          BIGINT        NOT NULL,
    [ORDERACCOUNT]                   NVARCHAR (20) NOT NULL,
    [DELIVERYDATE]                   DATETIME      NOT NULL,
    [INTERCOMPANYORIGINALSALESID]    NVARCHAR (20) NOT NULL,
    [INTERCOMPANYORIGINALCUSTACCO12] NVARCHAR (20) NOT NULL,
    [INTERCOMPANYDIRECTDELIVERY]     INT           NOT NULL,
    [PURCHSTATUS]                    INT           NOT NULL,
    [PURCHASETYPE]                   INT           NOT NULL,
    [INTERCOMPANYORIGIN]             INT           NOT NULL,
    [DOCUMENTSTATUS]                 INT           NOT NULL,
    [PURCHPOOLID]                    NVARCHAR (10) NOT NULL,
    [VENDORREF]                      NVARCHAR (60) NOT NULL,
    [INTERCOMPANYCOMPANYID]          CHAR (4)      NOT NULL,
    [INTERCOMPANYSALESID]            NVARCHAR (20) NOT NULL,
    [INTERCOMPANYORDER]              INT           NOT NULL,
    [CREATEDDATETIME]                DATETIME      NOT NULL,
    [CURRENCYCODE]                   NVARCHAR (3)  NOT NULL
);
GO

ALTER TABLE [AX2009].[PURCHTABLE_OrdiniFornitore]
    ADD CONSTRAINT [PK_PURCHTABLE_OrdiniFornitore] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC, [PURCHID] ASC);
GO

