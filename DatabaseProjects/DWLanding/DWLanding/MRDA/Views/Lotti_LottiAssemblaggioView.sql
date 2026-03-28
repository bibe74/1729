
CREATE VIEW MRDA.Lotti_LottiAssemblaggioView
AS
SELECT
    -- Chiavi
    ID,        -- IDLottoAssemblaggio

    -- Dimensioni
    IDTurno,        -- IDTurnoAssemblaggio
    IDPostazione,        -- IDPostazioneAssemblaggio
    IDCausaleChiusura,        -- IDCausaleChiusuraAssemblaggio
    NumeroLotto,        -- NumeroLotto
    Campionatura,        -- IsCampionatura
    CodiceCra,        -- CodiceCRA
    CodiceArticolo,        -- IDArticoloConfigurato
    TsInizio,        -- DataOraInizio
    TsFine,        -- DataOraFine
    Elab_Riconciliare,        -- IsRiconciliare
    Elab_Riconciliato,        -- IsRiconciliato
    Elab_Diagnostica,        -- IsDiagnostica
    Elab_DiagnosticaTs        -- DataOraDiagnostica

FROM [SQL2014\SCADA2014].RaccoltaDatiAssemblaggio.dbo.Lotti;
GO

