CREATE VIEW MRDA.LottiAttrezzaggi_LottiAssemblaggioAttrezzaggiView
AS
SELECT
    -- Chiavi
    ID,        -- PKLottiAssemblaggioAttrezzaggi

    -- Dimensioni
    IDLotto,        -- IDLottoAssemblaggio
    Inizio_Ts,        -- DataOraInizio
    Fine_Ts        -- DataOraFine

FROM [SQL2014\SCADA2014].RaccoltaDatiAssemblaggio.dbo.LottiAttrezzaggi;
GO

