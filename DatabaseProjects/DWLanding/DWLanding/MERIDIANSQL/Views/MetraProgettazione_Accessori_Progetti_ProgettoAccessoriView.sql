CREATE VIEW MERIDIANSQL.MetraProgettazione_Accessori_Progetti_ProgettoAccessoriView
AS
SELECT
    -- Chiavi
    ID,        -- IDProgettoAccessori

    -- Dimensioni
    Accessorio_Codice,        -- CodiceAccessorio
    Progetto_Numero,        -- Commessa
    Progetto_Sospeso,        -- IsSospeso
    CAST(REVISIONDATE AS DATE) AS REVISIONDATE,        -- DataRevisione
    REVISIONUSER,        -- UtenteRevisione
    Fornitore_Codice,        -- CodiceFornitore
    Fornitore_RagioneSociale,        -- Fornitore
    Fornitore_Email,        -- EmailFornitore
    Progetto_CodiceRiferimentoFornitore,        -- CodiceRiferimentoFornitore
    Progetto_ProprietaStampo,        -- ProprietaStampo

    -- Misure
    Progetto_QtaRichiesta,        -- QtaRichiesta
    Progetto_Scatola,        -- QtaScatola
    Progetto_QtaMinimaVendita,        -- QtaMinimaVendita
    Progetto_NPezziLottoMinimo,        -- NumeroPezziLottoMinimo
    Progetto_Costo,        -- Costo
    Progetto_Ammortamenti,        -- Ammortamenti
    Progetto_CostoUnitario,        -- CostoUnitario
    Progetto_IndiceMaggiorazioneCosto,        -- IndiceMaggiorazioneCosto
    Progetto_ParzialeCosto,        -- ParzialeCosto
    Progetto_AmmortamentoUnitario,        -- AmmortamentoUnitario
    Progetto_CostoAmmortamentoUnitario,        -- CostoAmmortamentoUnitario
    Progetto_IndiceMaggiorazioneAmmortamento,        -- IndiceMaggiorazioneAmmortamento
    Progetto_ParzialeAmmortamento        -- ParzialeAmmortamento

FROM [SQL2014\DB2014].MeridianSQL.dbo.MetraProgettazione_Accessori_Progetti;
GO

