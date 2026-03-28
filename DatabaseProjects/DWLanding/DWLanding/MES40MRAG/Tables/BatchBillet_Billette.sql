CREATE TABLE [MES40MRAG].[BatchBillet_Billette] (
    [BatchBilletID]            INT              NOT NULL,
    [BatchID]                  CHAR (15)        NOT NULL,
    [DieID]                    VARCHAR (20)     NOT NULL,
    [PressReducedProdReasonID] SMALLINT         NULL,
    [BilletNo]                 SMALLINT         NOT NULL,
    [StartTs]                  DATETIME         NULL,
    [StopTs]                   DATETIME         NULL,
    [SecCycle]                 INT              NOT NULL,
    [Billet1_CastingID]        CHAR (20)        NULL,
    [Billet2_CastingID]        CHAR (20)        NULL,
    [MmBilletAct]              INT              NULL,
    [MmBarSet]                 DECIMAL (28, 12) NULL,
    [MmBilletBackAct]          INT              NULL,
    [KgSheared]                DECIMAL (28, 12) NULL,
    [KgExtruded]               DECIMAL (28, 12) NULL,
    [KgItemMeter]              DECIMAL (28, 12) NULL,
    [Billet1_AlloyID]          NVARCHAR (20)    NULL,
    [Billet2_AlloyID]          NVARCHAR (20)    NULL,
    [ShiftID]                  CHAR (10)        NULL,
    [ShiftDate]                DATETIME         NULL,
    [ShiftDate_Normalized]     DATETIME         NULL,
    [KgCut]                    DECIMAL (28, 12) NULL,
    [SecDowntime]              INT              NULL,
    [SecExtrusion]             INT              NULL,
    [KgScrapShear]             DECIMAL (28, 12) NULL,
    [IsDieChange]              BIT              NULL,
    [ClosingReasonID]          TINYINT          NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_MES40MRAG_BatchBillet_Billette_StartTs_INCLUDE]
    ON [MES40MRAG].[BatchBillet_Billette]([StartTs] ASC)
    INCLUDE([BatchID], [BilletNo]);
GO

ALTER TABLE [MES40MRAG].[BatchBillet_Billette]
    ADD CONSTRAINT [PK_BatchBillet_Billette] PRIMARY KEY CLUSTERED ([BatchBilletID] ASC);
GO

