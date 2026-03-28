CREATE TABLE [MES40MALU].[BatchDieChanges_CambiMatrice] (
    [BatchID]          CHAR (15) NOT NULL,
    [DieChangeSeconds] INT       NOT NULL
);
GO

ALTER TABLE [MES40MALU].[BatchDieChanges_CambiMatrice]
    ADD CONSTRAINT [PK_BatchDieChanges_CambiMatrice] PRIMARY KEY CLUSTERED ([BatchID] ASC);
GO

