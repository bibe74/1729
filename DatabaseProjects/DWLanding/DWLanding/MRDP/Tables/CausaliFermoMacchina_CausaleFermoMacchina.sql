CREATE TABLE [MRDP].[CausaliFermoMacchina_CausaleFermoMacchina] (
    [ID]          SMALLINT     NOT NULL,
    [Descrizione] VARCHAR (50) NULL,
    [ClasseDisp]  INT          NULL,
    [Attiva]      BIT          NULL
);
GO

ALTER TABLE [MRDP].[CausaliFermoMacchina_CausaleFermoMacchina]
    ADD CONSTRAINT [PK_CausaliFermoMacchina_CausaleFermoMacchina] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

