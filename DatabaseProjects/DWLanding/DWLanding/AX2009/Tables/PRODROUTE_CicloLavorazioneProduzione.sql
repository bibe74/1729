CREATE TABLE [AX2009].[PRODROUTE_CicloLavorazioneProduzione] (
    [DATAAREAID]    CHAR (4)         NOT NULL,
    [PRODID]        NVARCHAR (20)    NOT NULL,
    [OPRNUM]        INT              NOT NULL,
    [RECID]         BIGINT           NOT NULL,
    [OPRID]         NVARCHAR (10)    NOT NULL,
    [WRKCTRID]      NVARCHAR (10)    NOT NULL,
    [PROCESSTIME]   NUMERIC (28, 12) NOT NULL,
    [PROCESSPERQTY] NUMERIC (28, 12) NOT NULL,
    [TOHOURS]       NUMERIC (28, 12) NOT NULL
);
GO

ALTER TABLE [AX2009].[PRODROUTE_CicloLavorazioneProduzione]
    ADD CONSTRAINT [PK_PRODROUTE_CicloLavorazioneProduzione] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC, [PRODID] ASC, [OPRNUM] ASC, [RECID] ASC);
GO

CREATE STATISTICS [RECID]
    ON [AX2009].[PRODROUTE_CicloLavorazioneProduzione]([RECID]);
GO

