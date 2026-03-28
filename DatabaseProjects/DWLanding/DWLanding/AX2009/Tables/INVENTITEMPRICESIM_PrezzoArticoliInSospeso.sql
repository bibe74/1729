CREATE TABLE [AX2009].[INVENTITEMPRICESIM_PrezzoArticoliInSospeso] (
    [DATAAREAID]          CHAR (4)         NOT NULL,
    [ITEMID]              NVARCHAR (20)    NOT NULL,
    [VERSIONID]           NVARCHAR (10)    NOT NULL,
    [RECID]               BIGINT           NOT NULL,
    [FROMDATE]            DATE             NOT NULL,
    [PRICETYPE]           SMALLINT         NOT NULL,
    [INVENTDIMID]         NVARCHAR (20)    NOT NULL,
    [PRICEUNIT]           NUMERIC (28, 12) NOT NULL,
    [PRICECALCID]         NVARCHAR (20)    NOT NULL,
    [UNITID]              NVARCHAR (10)    NOT NULL,
    [PRICEALLOCATEMARKUP] BIT              NOT NULL,
    [PRICE]               NUMERIC (28, 12) NOT NULL,
    [PRICEQTY]            NUMERIC (28, 12) NOT NULL,
    [MARKUP]              NUMERIC (28, 12) NOT NULL
);
GO

ALTER TABLE [AX2009].[INVENTITEMPRICESIM_PrezzoArticoliInSospeso]
    ADD CONSTRAINT [PK_INVENTITEMPRICESIM_PrezzoArticoliInSospeso] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC, [ITEMID] ASC, [VERSIONID] ASC, [RECID] ASC) WITH (FILLFACTOR = 100);
GO

