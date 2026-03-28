
CREATE VIEW RRDP.CausaliMicrofermoMacchina_CausaleMicroFermoMacchinaView
AS
SELECT
    -- Chiavi
    ID,        -- IDCausaleMicroFermoMacchina

    -- Dimensioni
    Descrizione,        -- CausaleMicroFermoMacchina
    ClasseDisp,        -- ClasseDisponibilita
    Attiva        -- IsAttiva

FROM [SQL2014MRAG\SCADA2014].RaccoltaDatiProduzione.dbo.CausaliMicrofermoMacchina;
GO

