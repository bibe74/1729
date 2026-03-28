
CREATE VIEW IRDP.CausaliFermoMacchina_CausaleFermoMacchinaView
AS
SELECT
    -- Chiavi
    ID,        -- ID

    -- Dimensioni
    Descrizione,        -- Descrizione
    ClasseDisp,        -- ClasseDisponibilita
    Attiva        -- IsAttiva

FROM [SQL2012IMET\SCADA2012].Metra_RaccoltaDatiProduzione.dbo.CausaliFermoMacchina;
GO

