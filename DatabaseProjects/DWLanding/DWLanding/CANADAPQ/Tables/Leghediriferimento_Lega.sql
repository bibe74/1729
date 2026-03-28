CREATE TABLE [CANADAPQ].[Leghediriferimento_Lega] (
    [ID]          INT           NOT NULL,
    [Lega]        NVARCHAR (50) NULL,
    [LegaSuAS400] NVARCHAR (50) NULL
);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_CANADAPQ_Leghediriferimento_Lega_Lega]
    ON [CANADAPQ].[Leghediriferimento_Lega]([Lega] ASC);
GO

ALTER TABLE [CANADAPQ].[Leghediriferimento_Lega]
    ADD CONSTRAINT [PK_Leghediriferimento_Lega] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

