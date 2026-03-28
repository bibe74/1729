CREATE TABLE [MRDA].[CausaliChiusura_CausaleChiusuraAssemblaggio] (
    [ID]          INT           NOT NULL,
    [Descrizione] NVARCHAR (50) NOT NULL
);
GO

ALTER TABLE [MRDA].[CausaliChiusura_CausaleChiusuraAssemblaggio]
    ADD CONSTRAINT [PK_CausaliChiusura_CausaleChiusuraAssemblaggio] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

