CREATE TABLE [AX2009].[VENDTRANS_TransazioniFornitore] (
    [DATAAREAID]            CHAR (4)         NOT NULL,
    [TRANSDATE]             DATE             NOT NULL,
    [VOUCHER]               NVARCHAR (20)    NOT NULL,
    [ACCOUNTNUM]            NVARCHAR (20)    NOT NULL,
    [INVOICE]               NVARCHAR (20)    NOT NULL,
    [RECID]                 BIGINT           NOT NULL,
    [DUEDATE]               DATE             NOT NULL,
    [CLOSED]                DATE             NOT NULL,
    [TRANSTYPE]             SMALLINT         NOT NULL,
    [DOCUMENTDATE]          DATE             NOT NULL,
    [PAYMMODE]              NVARCHAR (10)    NOT NULL,
    [MODIFIEDTRANSACTIONID] BIGINT           NOT NULL,
    [CURRENCYCODE]          NVARCHAR (3)     NOT NULL,
    [AMOUNTCUR]             NUMERIC (28, 12) NOT NULL,
    [AMOUNTMST]             NUMERIC (28, 12) NOT NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_AX2009_VENDTRANS_TransazioniFornitore_DATAAREAID_VOUCHER_INCLUDE]
    ON [AX2009].[VENDTRANS_TransazioniFornitore]([DATAAREAID] ASC, [VOUCHER] ASC)
    INCLUDE([INVOICE], [DOCUMENTDATE], [PAYMMODE], [MODIFIEDTRANSACTIONID]);
GO

ALTER TABLE [AX2009].[VENDTRANS_TransazioniFornitore]
    ADD CONSTRAINT [PK_VENDTRANS_TransazioniFornitore] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC, [TRANSDATE] ASC, [VOUCHER] ASC, [ACCOUNTNUM] ASC, [INVOICE] ASC, [RECID] ASC);
GO

