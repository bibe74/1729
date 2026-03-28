CREATE TABLE [MRDA].[LottiControlliAstine_LottiAssemblaggioControlliAstine] (
    [ID]               INT           NOT NULL,
    [IDLottoControllo] INT           NOT NULL,
    [CodiceAstina]     NVARCHAR (20) NOT NULL,
    [LottoAstina]      NVARCHAR (50) NULL
);
GO

ALTER TABLE [MRDA].[LottiControlliAstine_LottiAssemblaggioControlliAstine]
    ADD CONSTRAINT [PK_LottiControlliAstine_LottiAssemblaggioControlliAstine] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

