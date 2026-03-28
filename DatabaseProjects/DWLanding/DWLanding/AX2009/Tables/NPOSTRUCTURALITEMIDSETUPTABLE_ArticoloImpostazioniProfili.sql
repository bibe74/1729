CREATE TABLE [AX2009].[NPOSTRUCTURALITEMIDSETUPTABLE_ArticoloImpostazioniProfili] (
    [DATAAREAID]           CHAR (4)         NOT NULL,
    [ITEMID]               NVARCHAR (20)    NOT NULL,
    [RECID]                BIGINT           NOT NULL,
    [STRUCTURALITEMTYPE]   SMALLINT         NOT NULL,
    [MNGTYPE]              SMALLINT         NOT NULL,
    [SECTORTYPE]           SMALLINT         NOT NULL,
    [SERIESID]             NVARCHAR (20)    NOT NULL,
    [CATEGORYID]           NVARCHAR (20)    NOT NULL,
    [PERIMETER]            INT              NOT NULL,
    [AREA]                 INT              NOT NULL,
    [DIAMETER]             INT              NOT NULL,
    [ROLLING]              BIT              NOT NULL,
    [TEAROFFSTRIP]         BIT              NOT NULL,
    [SECURITY]             BIT              NOT NULL,
    [ALLOYID]              NVARCHAR (20)    NOT NULL,
    [CUSTACCOUNT]          NVARCHAR (20)    NOT NULL,
    [PHYSICALSTATEALLOYID] NVARCHAR (10)    NOT NULL,
    [MAXLENGTH]            NUMERIC (28, 12) NOT NULL,
    [MINLENGTH]            NUMERIC (28, 12) NOT NULL,
    [STANDARDLENGTH]       NUMERIC (28, 12) NOT NULL,
    [NOSTDQTYLEADTIME]     INT              NOT NULL,
    [STRUCTURALWEIGHT]     NUMERIC (28, 12) NOT NULL,
    [MAXQUANTITY]          NUMERIC (28, 12) NOT NULL,
    [MINQUANTITY]          NUMERIC (28, 12) NOT NULL,
    [USEDINCATALOG]        BIT              NOT NULL,
    [MERIDIANNUMBER]       NVARCHAR (20)    NOT NULL,
    [STRUCTURALGLAZING]    BIT              NOT NULL,
    [ASSEMBLYPASSES]       INT              NOT NULL,
    [WIDTH]                INT              NOT NULL,
    [HEIGHT]               INT              NOT NULL,
    [PAINTINGHOOKS]        INT              NOT NULL
);
GO

ALTER TABLE [AX2009].[NPOSTRUCTURALITEMIDSETUPTABLE_ArticoloImpostazioniProfili]
    ADD CONSTRAINT [PK_NPOSTRUCTURALITEMIDSETUPTABLE_ArticoloImpostazioniProfili] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC, [ITEMID] ASC);
GO

