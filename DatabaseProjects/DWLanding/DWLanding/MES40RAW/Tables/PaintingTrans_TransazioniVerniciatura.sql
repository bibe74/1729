CREATE TABLE [MES40RAW].[PaintingTrans_TransazioniVerniciatura] (
    [PaintingTransID]  INT           NOT NULL,
    [BarLength]        DECIMAL (18)  NOT NULL,
    [BatchID]          NVARCHAR (20) NOT NULL,
    [CreatedTs]        DATETIME2 (7) NOT NULL,
    [IsPacked]         BIT           NOT NULL,
    [ItemID]           NVARCHAR (20) NOT NULL,
    [PackedTs]         DATETIME2 (7) NOT NULL,
    [PackQty]          INT           NOT NULL,
    [PaintFinishingID] NVARCHAR (20) NOT NULL,
    [ProdID]           NVARCHAR (20) NOT NULL,
    [Qty]              INT           NOT NULL,
    [ScrapQty]         INT           NOT NULL,
    [ShiftDate]        DATE          NOT NULL,
    [ShiftID]          CHAR (2)      NOT NULL,
    [TagFinishingID]   NVARCHAR (20) NOT NULL,
    [WrkCtrID]         NVARCHAR (20) NOT NULL,
    [ModuleID]         NVARCHAR (20) NOT NULL
);
GO

ALTER TABLE [MES40RAW].[PaintingTrans_TransazioniVerniciatura]
    ADD CONSTRAINT [PK_PaintingTrans_TransazioniVerniciatura] PRIMARY KEY CLUSTERED ([PaintingTransID] ASC);
GO

