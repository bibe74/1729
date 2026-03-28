CREATE TABLE [MRDA].[LottiOrdini_LottiAssemblaggioOrdini] (
    [ID]               INT           NOT NULL,
    [IDLotto]          INT           NOT NULL,
    [OrdineProduzione] NVARCHAR (50) NOT NULL,
    [OrdineCliente]    NVARCHAR (50) NULL,
    [Qta]              INT           NULL
);
GO

ALTER TABLE [MRDA].[LottiOrdini_LottiAssemblaggioOrdini]
    ADD CONSTRAINT [PK_LottiOrdini_LottiAssemblaggioOrdini] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

