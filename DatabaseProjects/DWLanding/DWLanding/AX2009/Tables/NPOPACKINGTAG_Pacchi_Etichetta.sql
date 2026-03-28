CREATE TABLE [AX2009].[NPOPACKINGTAG_Pacchi_Etichetta] (
    [DATAAREAID]             CHAR (4)       NOT NULL,
    [PACKINGID]              NVARCHAR (18)  NOT NULL,
    [RECID]                  BIGINT         NOT NULL,
    [CUSTNAME]               NVARCHAR (60)  NOT NULL,
    [CUSTACCOUNT]            NVARCHAR (20)  NOT NULL,
    [REASON]                 INT            NOT NULL,
    [CUSTADDRESS]            NVARCHAR (250) NOT NULL,
    [FINISHING]              NVARCHAR (20)  NOT NULL,
    [FINISHING2]             NVARCHAR (20)  NOT NULL,
    [IsDaLavorareMetraColor] BIT            NOT NULL
);
GO

ALTER TABLE [AX2009].[NPOPACKINGTAG_Pacchi_Etichetta]
    ADD CONSTRAINT [PK_NPOPACKINGTAG_Pacchi_Etichetta] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC, [PACKINGID] ASC);
GO

