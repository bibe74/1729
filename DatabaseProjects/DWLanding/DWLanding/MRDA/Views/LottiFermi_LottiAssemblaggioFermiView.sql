
CREATE VIEW MRDA.LottiFermi_LottiAssemblaggioFermiView
AS
SELECT
    -- Chiavi
    ID,        -- PKLottiAssemblaggioFermi

    -- Dimensioni
    IDLotto,        -- IDLottoAssemblaggio
    IDCausaleFermo,        -- IDCausaleFermoAssemblaggio
    Inizio_Ts,        -- DataOraInizio
    Fine_Ts,        -- DataOraFine
    Tipo,        -- Tipo
    IDPostazione        -- IDPostazione

FROM [SQL2014\SCADA2014].RaccoltaDatiAssemblaggio.dbo.LottiFermi;
GO

