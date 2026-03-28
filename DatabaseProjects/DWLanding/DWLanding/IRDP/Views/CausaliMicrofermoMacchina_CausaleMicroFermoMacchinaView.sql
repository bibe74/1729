
CREATE VIEW IRDP.CausaliMicrofermoMacchina_CausaleMicroFermoMacchinaView
AS
SELECT
    -- Chiavi
    ID,        -- IDCausaleMicroFermoMacchina

    -- Dimensioni
    Descrizione,        -- CausaleMicroFermoMacchina
    ClasseDisp,        -- ClasseDisponibilita
    Attiva        -- IsAttiva

FROM [SQL2012IMET\SCADA2012].Metra_RaccoltaDatiProduzione.dbo.CausaliMicrofermoMacchina;
GO

