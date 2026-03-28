CREATE TABLE [MES40MSPA].[ModuleTransSaw_DatiIncestamento] (
    [ModuleTransID] BIGINT          NOT NULL,
    [CreatedTs]     DATETIME2 (7)   NOT NULL,
    [BarLength]     DECIMAL (15, 5) NOT NULL,
    [BatchID]       NVARCHAR (20)   NOT NULL,
    [Qty]           INT             NOT NULL
);
GO

ALTER TABLE [MES40MSPA].[ModuleTransSaw_DatiIncestamento]
    ADD CONSTRAINT [PK_ModuleTransSaw_DatiIncestamento] PRIMARY KEY CLUSTERED ([ModuleTransID] ASC);
GO

