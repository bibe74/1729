CREATE TABLE [AX2009].[LEDGERTRANS_TransazioniContabili] (
    [DATAAREAID]             CHAR (4)         NOT NULL,
    [TRANSDATE]              DATETIME         NOT NULL,
    [VOUCHER]                NVARCHAR (20)    NOT NULL,
    [RECID]                  BIGINT           NOT NULL,
    [ACCOUNTNUM]             NVARCHAR (20)    NOT NULL,
    [TXT]                    NVARCHAR (60)    NOT NULL,
    [TRANSTYPE]              INT              NOT NULL,
    [DIMENSION]              NVARCHAR (10)    NOT NULL,
    [DIMENSION2_]            NVARCHAR (10)    NOT NULL,
    [DIMENSION3_]            NVARCHAR (10)    NOT NULL,
    [POSTING]                INT              NOT NULL,
    [PERIODCODE]             INT              NOT NULL,
    [OPERATIONSTAX]          INT              NOT NULL,
    [LEDGERPOSTINGJOURNALID] NVARCHAR (10)    NOT NULL,
    [TAXREFID]               INT              NOT NULL,
    [CREATEDDATETIME]        DATETIME         NOT NULL,
    [NPOVALUEDATE]           DATE             NOT NULL,
    [NPOCUSTVENDAC]          NVARCHAR (20)    NOT NULL,
    [DIMENSION4_]            NVARCHAR (10)    NOT NULL,
    [DIMENSION5_]            NVARCHAR (10)    NOT NULL,
    [DIMENSION6_]            NVARCHAR (10)    NOT NULL,
    [CURRENCYCODE]           NVARCHAR (3)     NOT NULL,
    [AMOUNTCUR]              NUMERIC (28, 12) NOT NULL,
    [AMOUNTMST]              NUMERIC (28, 12) NOT NULL,
    [QTY]                    NUMERIC (28, 12) NOT NULL
);
GO

ALTER TABLE [AX2009].[LEDGERTRANS_TransazioniContabili]
    ADD CONSTRAINT [PK_LEDGERTRANS_TransazioniContabili] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC, [TRANSDATE] ASC, [VOUCHER] ASC, [RECID] ASC);
GO

