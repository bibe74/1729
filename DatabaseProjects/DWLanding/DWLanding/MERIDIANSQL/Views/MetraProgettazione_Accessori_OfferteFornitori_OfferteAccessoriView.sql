
CREATE VIEW MERIDIANSQL.MetraProgettazione_Accessori_OfferteFornitori_OfferteAccessoriView
AS
SELECT
    -- Chiavi
    ID,        -- IDOfferteAccessori

    -- Dimensioni
    IDFornitore,        -- IDFornitore
    CodiceAccessorio,        -- CodiceAccessorio
    DataOfferta,        -- DataOfferta
    Lotto,        -- IDLotto
    ProprietaAttrezzatura,        -- ProprietaAttrezzatura
    Progetto,        -- Commessa
    Documento,        -- Documento
    Revisione,        -- Revisione
    RevisioneSuperata,        -- IsRevisioneSuperata

    -- Misure
    UnitaMisura,        -- IDUnitaMisura
    Scatola,        -- QtaScatola
    QtaMinimaVendita,        -- QtaMinimaVendita
    Peso,        -- Peso
    Costo,        -- Costo
    CostoAttrezzatura        -- CostoAttrezzatura

FROM [SQL2014\DB2014].MeridianSQL.dbo.MetraProgettazione_Accessori_OfferteFornitori;
GO

