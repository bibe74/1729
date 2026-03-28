CREATE TABLE [RRDP].[CausaliFermoMacchina_CausaleFermoMacchina] (
    [ID]          SMALLINT     NOT NULL,
    [Descrizione] VARCHAR (50) NULL,
    [ClasseDisp]  INT          NULL,
    [Attiva]      BIT          NULL
);
GO

ALTER TABLE [RRDP].[CausaliFermoMacchina_CausaleFermoMacchina]
    ADD CONSTRAINT [PK_CausaliFermoMacchina_CausaleFermoMacchina] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

