

CREATE PROCEDURE MRDP.usp_Create_RaccoltaDatiLotto_Billette_CalcoliBillette
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDP.RaccoltaDatiLotto_Billette_CalcoliBillette (
    -- Chiavi
    ID        INT NOT NULL,

    -- Dimensioni
    Turno        CHAR(2) NOT NULL,
    TurnoData        DATE NOT NULL,
    TurnoDataMetra        DATE NOT NULL,
    Lega        NVARCHAR(40) NOT NULL,
    IsCambioMatrice        BIT NOT NULL,

    -- Misure
    KgNettiTaglio        DECIMAL(28, 12) NOT NULL,
    KgNettiImballo        DECIMAL(28, 12) NOT NULL,
    KgImballati        DECIMAL(28, 12) NOT NULL,
    KgImballatiAXPesa        DECIMAL(28, 12) NOT NULL,
    KgImballatiAXTeorico        DECIMAL(28, 12) NOT NULL,
    KgScartoCesoia        DECIMAL(28, 12) NOT NULL,
    SecondiFermo        INT NOT NULL,
    SecondiCiclo        INT NOT NULL,
    SecondiEstrusione        INT NOT NULL

    -- Constraint
    CONSTRAINT PK_RaccoltaDatiLotto_Billette_CalcoliBillette PRIMARY KEY CLUSTERED (
        ID
    )
);

END;
GO

