CREATE TABLE [AX2009].[WMSORDERTRANS_OrdiniMagazzino_Riga] (
    [DATAAREAID]               CHAR (4)         NOT NULL,
    [ORDERID]                  NVARCHAR (20)    NOT NULL,
    [RECID]                    BIGINT           NOT NULL,
    [ROUTEID]                  NVARCHAR (10)    NOT NULL,
    [EXPEDITIONSTATUS]         SMALLINT         NOT NULL,
    [ITEMID]                   NVARCHAR (20)    NOT NULL,
    [OPERATOR]                 NVARCHAR (20)    NOT NULL,
    [EXPEDITIONTIME]           INT              NOT NULL,
    [ISRESERVED]               BIT              NOT NULL,
    [SHIPMENTIDORIGINAL]       NVARCHAR (10)    NOT NULL,
    [SHIPMENTID]               NVARCHAR (10)    NOT NULL,
    [INVENTDIMID]              NVARCHAR (20)    NOT NULL,
    [DLVDATE]                  DATE             NOT NULL,
    [ORDERTYPE]                SMALLINT         NOT NULL,
    [INVENTTRANSID]            NVARCHAR (20)    NOT NULL,
    [FULLPALLET]               BIT              NOT NULL,
    [TOINVENTDIMID]            NVARCHAR (20)    NOT NULL,
    [PALLETIDPICKED]           NVARCHAR (18)    NOT NULL,
    [INVENTTRANSTYPE]          SMALLINT         NOT NULL,
    [INVENTTRANSREFID]         NVARCHAR (20)    NOT NULL,
    [NPOKASTOID]               NVARCHAR (20)    NOT NULL,
    [NPOPACKINGSLIPID]         NVARCHAR (20)    NOT NULL,
    [NPOPACKINGSLIPTRANSRECID] BIGINT           NOT NULL,
    [CREATEDDATETIME]          DATETIME         NOT NULL,
    [NPOPICKEDDATETIME]        DATETIME         NOT NULL,
    [QTY]                      NUMERIC (28, 12) NOT NULL,
    [NPOPACKINGSLIPWEIGHT]     NUMERIC (28, 12) NOT NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_AX2009_WMSORDERTRANS_OrdiniMagazzino_Riga_DATAAREAID_INVENTTRANSID_EXPEDITIONSTATUS_QTY]
    ON [AX2009].[WMSORDERTRANS_OrdiniMagazzino_Riga]([DATAAREAID] ASC, [INVENTTRANSID] ASC, [EXPEDITIONSTATUS] ASC, [QTY] ASC);
GO

ALTER TABLE [AX2009].[WMSORDERTRANS_OrdiniMagazzino_Riga]
    ADD CONSTRAINT [PK_WMSORDERTRANS_OrdiniMagazzino_Riga] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC, [ORDERID] ASC, [RECID] ASC);
GO

