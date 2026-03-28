CREATE TABLE [AX2009].[INVENTTRANS_Transazioni] (
    [DATAAREAID]                    CHAR (4)         NOT NULL,
    [INVENTTRANSID]                 NVARCHAR (20)    NOT NULL,
    [RECID]                         BIGINT           NOT NULL,
    [ITEMID]                        NVARCHAR (20)    NOT NULL,
    [STATUSISSUE]                   SMALLINT         NOT NULL,
    [DATEPHYSICAL]                  DATE             NOT NULL,
    [TRANSTYPE]                     SMALLINT         NOT NULL,
    [TRANSREFID]                    NVARCHAR (20)    NOT NULL,
    [INVOICEID]                     NVARCHAR (20)    NOT NULL,
    [VOUCHER]                       NVARCHAR (20)    NOT NULL,
    [INVENTTRANSIDTRANSFER]         NVARCHAR (20)    NOT NULL,
    [DATEFINANCIAL]                 DATE             NOT NULL,
    [STATUSRECEIPT]                 SMALLINT         NOT NULL,
    [PACKINGSLIPID]                 NVARCHAR (20)    NOT NULL,
    [VOUCHERPHYSICAL]               NVARCHAR (20)    NOT NULL,
    [SHIPPINGDATEREQUESTED]         DATE             NOT NULL,
    [SHIPPINGDATECONFIRMED]         DATE             NOT NULL,
    [DIRECTION]                     SMALLINT         NOT NULL,
    [PICKINGROUTEID]                NVARCHAR (10)    NOT NULL,
    [INVENTDIMID]                   NVARCHAR (20)    NOT NULL,
    [DATEINVENT]                    DATE             NOT NULL,
    [CUSTVENDAC]                    NVARCHAR (20)    NOT NULL,
    [TRANSCHILDREFID]               NVARCHAR (20)    NOT NULL,
    [TRANSCHILDTYPE]                SMALLINT         NOT NULL,
    [INVENTREFTRANSID]              NVARCHAR (20)    NOT NULL,
    [NPOVALUEBACKGROUND]            SMALLINT         NOT NULL,
    [NCEREVENUEREFTRANSID]          NVARCHAR (20)    NOT NULL,
    [DataTransazione]               DATE             NOT NULL,
    [QTY]                           NUMERIC (28, 12) NOT NULL,
    [NPOINVENTQTYPHYSICALONHAND2UM] NUMERIC (28, 12) NOT NULL,
    [NPOPACKINGSLIPWEIGHT]          NUMERIC (28, 12) NOT NULL,
    [CURRENCYCODE]                  NVARCHAR (3)     NOT NULL,
    [COSTAMOUNTPOSTED]              NUMERIC (28, 12) NOT NULL,
    [COSTAMOUNTADJUSTMENT]          NUMERIC (28, 12) NOT NULL,
    [COSTAMOUNTPHYSICAL]            NUMERIC (28, 12) NOT NULL,
    [REVENUEAMOUNTPHYSICAL]         NUMERIC (28, 12) NOT NULL
);
GO

ALTER TABLE [AX2009].[INVENTTRANS_Transazioni]
    ADD CONSTRAINT [PK_INVENTTRANS_Transazioni] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC, [INVENTTRANSID] ASC, [RECID] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_AX2009_INVENTTRANS_Transazioni_TRANSTYPE_TRANSREFID_DATEFINANCIAL_INVOICEID_INCLUDE]
    ON [AX2009].[INVENTTRANS_Transazioni]([TRANSTYPE] ASC, [TRANSREFID] ASC, [DATEFINANCIAL] ASC, [INVOICEID] ASC)
    INCLUDE([QTY], [NPOINVENTQTYPHYSICALONHAND2UM]);
GO

