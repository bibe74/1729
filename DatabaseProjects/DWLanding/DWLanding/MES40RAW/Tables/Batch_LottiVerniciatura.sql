CREATE TABLE [MES40RAW].[Batch_LottiVerniciatura] (
    [BatchID]          NVARCHAR (40) NOT NULL,
    [BatchStartTs]     DATETIME2 (7) NOT NULL,
    [BatchStatusID]    SMALLINT      NOT NULL,
    [BatchStopTs]      DATETIME2 (7) NOT NULL,
    [BatchTypeID]      CHAR (1)      NOT NULL,
    [IsClosed]         BIT           NOT NULL,
    [IsDeleted]        BIT           NOT NULL,
    [PaintFinishingID] NVARCHAR (40) NOT NULL,
    [PaintingAreaID]   NVARCHAR (40) NOT NULL,
    [PaintingLineID]   NVARCHAR (40) NOT NULL,
    [TagFinishingID]   NVARCHAR (40) NOT NULL
);
GO

ALTER TABLE [MES40RAW].[Batch_LottiVerniciatura]
    ADD CONSTRAINT [PK_Batch_LottiVerniciatura] PRIMARY KEY CLUSTERED ([BatchID] ASC);
GO

