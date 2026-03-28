
CREATE VIEW MRDA.CausaliFermo_CausaleFermoAssemblaggioView
AS
SELECT
    -- Chiavi
    ID,        -- IDCausaleFermoAssemblaggio

    -- Dimensioni
    Descrizione,        -- CausaleFermoAssemblaggio
    Attrezzaggio,        -- IsAttrezzaggio
    Produzione,        -- IsProduzione
    Disponibilita,        -- IsDisponibilita
    EscludiDaCalcoloResa        -- IsEscludiDaCalcoloResa

FROM [SQL2014\SCADA2014].RaccoltaDatiAssemblaggio.Anagrafica.CausaliFermo;
GO

