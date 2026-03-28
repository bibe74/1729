CREATE TABLE [AX2009].[NPOPACKING_Pacchi] (
    [DATAAREAID]              CHAR (4)         NOT NULL,
    [PACKINGID]               NVARCHAR (18)    NOT NULL,
    [RECID]                   BIGINT           NOT NULL,
    [WORKSTATIONID]           NVARCHAR (20)    NOT NULL,
    [EMPLID]                  NVARCHAR (20)    NOT NULL,
    [INVENTLOCATIONID]        NVARCHAR (10)    NOT NULL,
    [WMSLOCATIONID]           NVARCHAR (10)    NOT NULL,
    [SHIFTID]                 NVARCHAR (2)     NOT NULL,
    [CUSTACCOUNT]             NVARCHAR (20)    NOT NULL,
    [CLOSED]                  BIT              NOT NULL,
    [DESTROYED]               BIT              NOT NULL,
    [PALLETID]                NVARCHAR (18)    NOT NULL,
    [SCRAPPACKAGE]            BIT              NOT NULL,
    [WORKSTATIONAREAID]       NVARCHAR (25)    NOT NULL,
    [WMSLOCATIONIDTO]         NVARCHAR (10)    NOT NULL,
    [INTERCOMPANYCUSTACCOUNT] NVARCHAR (20)    NOT NULL,
    [INTERCOMPANYCUSTNAME]    NVARCHAR (60)    NOT NULL,
    [INVENTSITEID]            NVARCHAR (10)    NOT NULL,
    [SCRAPCAUSEID]            NVARCHAR (10)    NOT NULL,
    [SAVED]                   BIT              NOT NULL,
    [SCALEWORKSTATIONID]      NVARCHAR (20)    NOT NULL,
    [SCALEEMPLID]             NVARCHAR (20)    NOT NULL,
    [SCALEWORKSTATIONAREAID]  NVARCHAR (25)    NOT NULL,
    [SCALEDATETIME]           DATETIME         NOT NULL,
    [REASON]                  INT              NOT NULL,
    [LOTID]                   NVARCHAR (15)    NOT NULL,
    [ISPROD]                  BIT              NOT NULL,
    [SCRAPPACKAGETYPE]        SMALLINT         NOT NULL,
    [SUSPENDED]               BIT              NOT NULL,
    [INTERCOMPANY]            BIT              NOT NULL,
    [INTERCOMPANYCOMPANYID]   CHAR (4)         NOT NULL,
    [CREATEDDATETIME]         DATETIME         NOT NULL,
    [REINSTATEMENTMATERIAL]   BIT              NOT NULL,
    [MARKERID]                NVARCHAR (10)    NOT NULL,
    [QTYGOOD]                 NUMERIC (28, 12) NOT NULL,
    [QTYERROR]                NUMERIC (28, 12) NOT NULL,
    [QTYTOT]                  NUMERIC (28, 12) NOT NULL,
    [GROSSKG]                 NUMERIC (28, 12) NOT NULL,
    [NETKG]                   NUMERIC (28, 12) NOT NULL,
    [TAREKG]                  NUMERIC (28, 12) NOT NULL,
    [EXPECTEDNETKG]           NUMERIC (28, 12) NOT NULL,
    [MEASUREDNETKG]           NUMERIC (28, 12) NOT NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_AX2009_NPOPACKING_Pacchi_DATAAREAID_CLOSED_DESTROYED_SCRAPPACKAGE_LOTID]
    ON [AX2009].[NPOPACKING_Pacchi]([DATAAREAID] ASC, [CLOSED] ASC, [DESTROYED] ASC, [SCRAPPACKAGE] ASC, [LOTID] ASC);
GO

ALTER TABLE [AX2009].[NPOPACKING_Pacchi]
    ADD CONSTRAINT [PK_NPOPACKING_Pacchi] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC, [PACKINGID] ASC);
GO

