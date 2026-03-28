CREATE TABLE [MRDA].[LottiProduzioni_LottiAssemblaggioProduzioni] (
    [ID]                    INT           NOT NULL,
    [IDLotto]               INT           NOT NULL,
    [Inizio_Ts]             DATETIME      NULL,
    [Fine_Ts]               DATETIME      NULL,
    [Qta]                   INT           NULL,
    [NumeroPassate]         INT           NULL,
    [ItemId]                NVARCHAR (20) NULL,
    [ItemLength]            INT           NULL,
    [ProdRidotta]           BIT           NULL,
    [ProdRidotta_IDCausale] INT           NULL
);
GO

ALTER TABLE [MRDA].[LottiProduzioni_LottiAssemblaggioProduzioni]
    ADD CONSTRAINT [PK_LottiProduzioni_LottiAssemblaggioProduzioni] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

