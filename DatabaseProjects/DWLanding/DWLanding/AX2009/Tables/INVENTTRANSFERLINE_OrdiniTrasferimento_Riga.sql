CREATE TABLE [AX2009].[INVENTTRANSFERLINE_OrdiniTrasferimento_Riga] (
    [DATAAREAID]              CHAR (4)         NOT NULL,
    [TRANSFERID]              NVARCHAR (20)    NOT NULL,
    [LINENUM]                 NUMERIC (28, 12) NOT NULL,
    [RECID]                   BIGINT           NOT NULL,
    [ITEMID]                  NVARCHAR (20)    NOT NULL,
    [INVENTTRANSID]           NVARCHAR (20)    NOT NULL,
    [INVENTTRANSIDRECEIVE]    NVARCHAR (20)    NOT NULL,
    [SHIPDATE]                DATE             NOT NULL,
    [RECEIVEDATE]             DATE             NOT NULL,
    [NPOINVENTTRANSIDPRODBOM] NVARCHAR (20)    NOT NULL,
    [UNITID]                  NVARCHAR (10)    NOT NULL,
    [QTYTRANSFER]             NUMERIC (28, 12) NOT NULL,
    [QTYREMAINSHIP]           NUMERIC (28, 12) NOT NULL,
    [QTYSHIPPED]              NUMERIC (28, 12) NOT NULL
);
GO

CREATE STATISTICS [RECID]
    ON [AX2009].[INVENTTRANSFERLINE_OrdiniTrasferimento_Riga]([RECID]);
GO

ALTER TABLE [AX2009].[INVENTTRANSFERLINE_OrdiniTrasferimento_Riga]
    ADD CONSTRAINT [PK_INVENTTRANSFERLINE_OrdiniTrasferimento_Riga] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC, [TRANSFERID] ASC, [LINENUM] ASC, [RECID] ASC);
GO

