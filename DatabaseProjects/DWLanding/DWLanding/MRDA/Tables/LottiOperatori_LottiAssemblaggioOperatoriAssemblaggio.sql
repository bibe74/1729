CREATE TABLE [MRDA].[LottiOperatori_LottiAssemblaggioOperatoriAssemblaggio] (
    [ID]          INT           NOT NULL,
    [IDLotto]     INT           NOT NULL,
    [IDOperatore] NVARCHAR (10) NOT NULL
);
GO

ALTER TABLE [MRDA].[LottiOperatori_LottiAssemblaggioOperatoriAssemblaggio]
    ADD CONSTRAINT [PK_LottiOperatori_LottiAssemblaggioOperatoriAssemblaggio] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

