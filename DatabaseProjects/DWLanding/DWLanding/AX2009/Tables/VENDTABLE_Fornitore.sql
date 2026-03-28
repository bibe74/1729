CREATE TABLE [AX2009].[VENDTABLE_Fornitore] (
    [DATAAREAID]               CHAR (4)      NOT NULL,
    [ACCOUNTNUM]               NVARCHAR (20) NOT NULL,
    [RECID]                    BIGINT        NOT NULL,
    [NAME]                     NVARCHAR (60) NOT NULL,
    [VENDGROUP]                NVARCHAR (10) NOT NULL,
    [PAYMTERMID]               NVARCHAR (10) NOT NULL,
    [CUSTACCOUNT]              NVARCHAR (20) NOT NULL,
    [VATNUM]                   NVARCHAR (20) NOT NULL,
    [PAYMMODE]                 NVARCHAR (10) NOT NULL,
    [PURCHPOOLID]              NVARCHAR (10) NOT NULL,
    [FISCALCODE]               NVARCHAR (16) NOT NULL,
    [PARTYID]                  NVARCHAR (20) NOT NULL,
    [PARTYTYPE]                INT           NOT NULL,
    [FDY_DOCF_VOCEFINANZIARIA] NVARCHAR (6)  NOT NULL
);
GO

ALTER TABLE [AX2009].[VENDTABLE_Fornitore]
    ADD CONSTRAINT [PK_VENDTABLE_Fornitore] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC, [ACCOUNTNUM] ASC);
GO

