CREATE TABLE [IRDP].[CausaliMicrofermoMacchina_CausaleMicroFermoMacchina] (
    [ID]          SMALLINT     NOT NULL,
    [Descrizione] VARCHAR (50) NULL,
    [ClasseDisp]  INT          NULL,
    [Attiva]      BIT          NULL
);
GO

ALTER TABLE [IRDP].[CausaliMicrofermoMacchina_CausaleMicroFermoMacchina]
    ADD CONSTRAINT [PK_CausaliMicrofermoMacchina_CausaleMicroFermoMacchina] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

