CREATE TABLE [METRAPQ].[Leghediriferimento_Lega] (
    [ID]          INT           NOT NULL,
    [Lega]        NVARCHAR (50) NULL,
    [LegaSuAS400] NVARCHAR (50) NULL
);
GO

ALTER TABLE [METRAPQ].[Leghediriferimento_Lega]
    ADD CONSTRAINT [PK_Leghediriferimento_Lega] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_METRAPQ_Leghediriferimento_Lega_Lega]
    ON [METRAPQ].[Leghediriferimento_Lega]([Lega] ASC);
GO

