
CREATE PROCEDURE MERIDIANSQL.usp_Create_MetraProgettazione_Accessori_OfferteFornitori_OfferteAccessori
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MERIDIANSQL.MetraProgettazione_Accessori_OfferteFornitori_OfferteAccessori (
    -- Chiavi
    ID        BIGINT NOT NULL,

    -- Dimensioni
    IDFornitore        NVARCHAR(20) NOT NULL,
    CodiceAccessorio        NVARCHAR(20) NOT NULL,
    DataOfferta        DATE NOT NULL,
    Lotto        INT,
    ProprietaAttrezzatura        NVARCHAR(50),
    Progetto        NVARCHAR(50) NOT NULL,
    Documento        NVARCHAR(50),
    Revisione        NVARCHAR(10),
    RevisioneSuperata        BIT,

    -- Misure
    UnitaMisura        NVARCHAR(10),
    Scatola        NVARCHAR(255),
    QtaMinimaVendita        BIGINT,
    Peso        DECIMAL(28, 12),
    Costo        DECIMAL(28, 12),
    CostoAttrezzatura        DECIMAL(28, 12)

    -- Constraint
    CONSTRAINT PK_MetraProgettazione_Accessori_OfferteFornitori_OfferteAccessori PRIMARY KEY CLUSTERED (
        ID
    )
);

END;
GO

