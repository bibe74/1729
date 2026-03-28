
CREATE VIEW MRDA.LottiProduzioni_LottiAssemblaggioProduzioniView
AS
SELECT
    -- Chiavi
    ID,        -- PKLottiAssemblaggioProduzioni

    -- Dimensioni
    IDLotto,        -- IDLottoAssemblaggio
    Inizio_Ts,        -- DataOraInizio
    Fine_Ts,        -- DataOraFine
    Qta,        -- Qta
    NumeroPassate,        -- NumeroPassate
    ItemId,        -- ItemId
    ItemLength,        -- ItemLength
    ProdRidotta,        -- IsProduzioneRidotta
    ProdRidotta_IDCausale        -- IDCausaleProduzioneRidotta

FROM [SQL2014\SCADA2014].RaccoltaDatiAssemblaggio.dbo.LottiProduzioni;
GO

