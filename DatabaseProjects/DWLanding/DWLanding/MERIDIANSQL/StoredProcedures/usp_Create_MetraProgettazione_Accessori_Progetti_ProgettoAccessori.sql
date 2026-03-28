CREATE PROCEDURE MERIDIANSQL.usp_Create_MetraProgettazione_Accessori_Progetti_ProgettoAccessori
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MERIDIANSQL.MetraProgettazione_Accessori_Progetti_ProgettoAccessori (
    -- Chiavi
    ID        INT NOT NULL,

    -- Dimensioni
    Accessorio_Codice        NVARCHAR(15) NOT NULL,
    Progetto_Numero        NVARCHAR(100) NOT NULL,
    Progetto_Sospeso        BIT,
    REVISIONDATE        DATE,
    REVISIONUSER        NVARCHAR(50),
    Fornitore_Codice        NVARCHAR(255),
    Fornitore_RagioneSociale        NVARCHAR(255),
    Fornitore_Email        NVARCHAR(255),
    Progetto_CodiceRiferimentoFornitore        NVARCHAR(255),
    Progetto_ProprietaStampo        NVARCHAR(255),

    -- Misure
    Progetto_QtaRichiesta        NVARCHAR(255),
    Progetto_Scatola        NVARCHAR(255),
    Progetto_QtaMinimaVendita        BIGINT,
    Progetto_NPezziLottoMinimo        BIGINT,
    Progetto_Costo        DECIMAL(28, 12),
    Progetto_Ammortamenti        DECIMAL(28, 12),
    Progetto_CostoUnitario        DECIMAL(28, 12),
    Progetto_IndiceMaggiorazioneCosto        DECIMAL(28, 12),
    Progetto_ParzialeCosto        DECIMAL(28, 12),
    Progetto_AmmortamentoUnitario        DECIMAL(28, 12),
    Progetto_CostoAmmortamentoUnitario        DECIMAL(28, 12),
    Progetto_IndiceMaggiorazioneAmmortamento        DECIMAL(28, 12),
    Progetto_ParzialeAmmortamento        DECIMAL(28, 12)

    -- Constraint
    CONSTRAINT PK_MetraProgettazione_Accessori_Progetti_ProgettoAccessori PRIMARY KEY CLUSTERED (
        ID
    )
);

END;
GO

