CREATE TABLE [AX2009].[MARKUPTRANS_TransazioniSpeseAccessorie] (
    [DATAAREAID]       CHAR (4)         NOT NULL,
    [TRANSTABLEID]     INT              NOT NULL,
    [TRANSRECID]       BIGINT           NOT NULL,
    [LINENUM]          NUMERIC (28, 12) NOT NULL,
    [RECID]            BIGINT           NOT NULL,
    [MARKUPCODE]       NVARCHAR (10)    NOT NULL,
    [TRANSDATE]        DATE             NOT NULL,
    [TXT]              NVARCHAR (100)   NOT NULL,
    [CURRENCYCODE]     NVARCHAR (3)     NOT NULL,
    [VALUE]            NUMERIC (28, 12) NOT NULL,
    [CALCULATEDAMOUNT] NUMERIC (28, 12) NOT NULL
);
GO

ALTER TABLE [AX2009].[MARKUPTRANS_TransazioniSpeseAccessorie]
    ADD CONSTRAINT [PK_MARKUPTRANS_TransazioniSpeseAccessorie] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC, [TRANSTABLEID] ASC, [TRANSRECID] ASC, [LINENUM] ASC);
GO

