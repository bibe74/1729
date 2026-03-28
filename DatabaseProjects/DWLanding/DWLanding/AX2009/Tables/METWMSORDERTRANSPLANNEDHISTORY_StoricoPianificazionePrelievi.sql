CREATE TABLE [AX2009].[METWMSORDERTRANSPLANNEDHISTORY_StoricoPianificazionePrelievi] (
    [DATAAREAID]                    CHAR (4)         NOT NULL,
    [BATCHID]                       DATETIME         NOT NULL,
    [RECID]                         BIGINT           NOT NULL,
    [ORDERTYPE]                     BIT              NOT NULL,
    [WMSORDERTRANSEXPEDITIONSTATUS] SMALLINT         NOT NULL,
    [ITEMID]                        NVARCHAR (20)    NOT NULL,
    [ORDERID]                       NVARCHAR (20)    NOT NULL,
    [INVENTDIMID]                   NVARCHAR (20)    NOT NULL,
    [DLVDATE]                       DATE             NOT NULL,
    [INVENTTRANSID]                 NVARCHAR (20)    NOT NULL,
    [INVENTTRANSTYPE]               SMALLINT         NOT NULL,
    [INVENTTRANSREFID]              NVARCHAR (20)    NOT NULL,
    [SALESID]                       NVARCHAR (20)    NOT NULL,
    [LINENUM]                       INT              NOT NULL,
    [INVENTLOCATIONIDTO]            NVARCHAR (10)    NOT NULL,
    [ITEMFINISHINGID]               NVARCHAR (512)   NOT NULL,
    [ITEMFINISHINGIDFINAL]          NVARCHAR (512)   NOT NULL,
    [INVENTITEMTYPE]                NVARCHAR (20)    NOT NULL,
    [PICKAVAILABLE]                 BIT              NOT NULL,
    [REMAINONHANDQTY]               DECIMAL (28, 12) NOT NULL,
    [QTY]                           DECIMAL (28, 12) NOT NULL,
    [REMAINSALESPHYSICAL]           DECIMAL (28, 12) NOT NULL
);
GO

ALTER TABLE [AX2009].[METWMSORDERTRANSPLANNEDHISTORY_StoricoPianificazionePrelievi]
    ADD CONSTRAINT [PK_METWMSORDERTRANSPLANNEDHISTORY_StoricoPianificazionePrelievi] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC, [BATCHID] ASC, [RECID] ASC);
GO

