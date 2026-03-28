
CREATE VIEW MRDA.CausaliProdRidotta_CausaleProduzioneRidottaView
AS
SELECT
    -- Chiavi
    ID,        -- IDCausaleProduzioneRidotta

    -- Dimensioni
    Descrizione        -- CausaleProduzioneRidotta

FROM [SQL2014\SCADA2014].RaccoltaDatiAssemblaggio.Anagrafica.CausaliProdRidotta;
GO

