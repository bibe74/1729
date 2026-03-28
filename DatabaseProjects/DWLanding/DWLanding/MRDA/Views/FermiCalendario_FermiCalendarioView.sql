
CREATE VIEW MRDA.FermiCalendario_FermiCalendarioView
AS
SELECT
    -- Chiavi
    IDPostazione,        -- IDPostazione
    TsStart,        -- DataOraInizio

    -- Dimensioni
    TsStop        -- DataOraFine

FROM [SQL2014\SCADA2014].RaccoltaDatiAssemblaggio.dbo.FermiCalendario;
GO

