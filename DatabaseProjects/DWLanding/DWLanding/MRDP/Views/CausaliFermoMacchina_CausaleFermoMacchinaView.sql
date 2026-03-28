
CREATE VIEW MRDP.CausaliFermoMacchina_CausaleFermoMacchinaView
AS
SELECT
    -- Chiavi
    ID,        -- ID

    -- Dimensioni
    Descrizione,        -- Descrizione
    ClasseDisp,        -- ClasseDisponibilita
    Attiva        -- IsAttiva

FROM [SQL2014\SCADA2014].RaccoltaDatiProduzione.dbo.CausaliFermoMacchina;
GO

