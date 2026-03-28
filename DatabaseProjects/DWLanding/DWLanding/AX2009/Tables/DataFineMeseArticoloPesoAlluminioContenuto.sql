CREATE TABLE [AX2009].[DataFineMeseArticoloPesoAlluminioContenuto] (
    [DATAAREAID]    NVARCHAR (4)     NOT NULL,
    [ITEMID]        NVARCHAR (20)    NOT NULL,
    [TRANSDATE]     DATETIME         NOT NULL,
    [PRICECALCID]   NVARCHAR (20)    NOT NULL,
    [ItemCount]     INT              NULL,
    [NetWeight]     NUMERIC (38, 12) NULL,
    [NetWeight_New] DECIMAL (38, 12) NULL
);
GO

ALTER TABLE [AX2009].[DataFineMeseArticoloPesoAlluminioContenuto]
    ADD CONSTRAINT [PK_AX2009_DataFineMeseArticoloPesoAlluminioContenuto] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC, [ITEMID] ASC, [TRANSDATE] ASC);
GO

