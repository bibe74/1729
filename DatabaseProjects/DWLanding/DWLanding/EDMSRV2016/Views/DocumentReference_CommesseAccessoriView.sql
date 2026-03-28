
CREATE VIEW EDMSRV2016.DocumentReference_CommesseAccessoriView
AS
SELECT
    -- Chiavi
    ID,        -- PKCommesseAccessori

    -- Dimensioni
    SourceID,        -- IDCommessa
    TargetID,        -- IDAccessorio
    ReferenceTypeID        -- IDTipoRiferimento

FROM EDMSRV2016.BCRepository.dbo.DocumentReference;
GO

