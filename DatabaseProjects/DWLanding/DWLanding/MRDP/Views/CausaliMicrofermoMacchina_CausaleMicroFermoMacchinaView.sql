
CREATE VIEW MRDP.CausaliMicrofermoMacchina_CausaleMicroFermoMacchinaView
AS
SELECT
    -- Chiavi
    ID,        -- IDCausaleMicroFermoMacchina

    -- Dimensioni
    Descrizione,        -- CausaleMicroFermoMacchina
    ClasseDisp,        -- ClasseDisponibilita
    Attiva        -- IsAttiva

FROM [SQL2014\SCADA2014].RaccoltaDatiProduzione.dbo.CausaliMicrofermoMacchina;
GO

