
CREATE PROCEDURE MRDP.usp_Create_RaccoltaDatiLotto_CalcoliLotto_CalcoliLotto
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDP.RaccoltaDatiLotto_CalcoliLotto_CalcoliLotto (
    -- Chiavi
    ID        BIGINT NOT NULL,

    -- Dimensioni
    DiametroBilletta        DECIMAL(28, 12) NOT NULL,
    PesoProfiloAlMetroMatrice        DECIMAL(28, 12) NOT NULL,

    -- Misure
    BarreTagliate        SMALLINT NOT NULL,
    NumeroCeste        SMALLINT NOT NULL,
    KgImballati        DECIMAL(28, 12) NOT NULL,
    KgImballatiAXPesa        DECIMAL(28, 12) NOT NULL,
    KgImballatiAXTeorico        DECIMAL(28, 12) NOT NULL

    -- Constraint
    CONSTRAINT PK_RaccoltaDatiLotto_CalcoliLotto_CalcoliLotto PRIMARY KEY CLUSTERED (
        ID
    )
);

END;
GO

