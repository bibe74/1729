CREATE TABLE [MRDA].[CausaliFermo_CausaleFermoAssemblaggio] (
    [ID]                   INT           NOT NULL,
    [Descrizione]          NVARCHAR (50) NOT NULL,
    [Attrezzaggio]         BIT           NOT NULL,
    [Produzione]           BIT           NOT NULL,
    [Disponibilita]        BIT           NOT NULL,
    [EscludiDaCalcoloResa] BIT           NOT NULL
);
GO

ALTER TABLE [MRDA].[CausaliFermo_CausaleFermoAssemblaggio]
    ADD CONSTRAINT [PK_CausaliFermo_CausaleFermoAssemblaggio] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

