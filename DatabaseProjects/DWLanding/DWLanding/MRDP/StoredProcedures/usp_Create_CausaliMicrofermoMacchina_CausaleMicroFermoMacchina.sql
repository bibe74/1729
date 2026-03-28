
CREATE PROCEDURE MRDP.usp_Create_CausaliMicrofermoMacchina_CausaleMicroFermoMacchina
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDP.CausaliMicrofermoMacchina_CausaleMicroFermoMacchina (
    -- Chiavi
    ID        SMALLINT NOT NULL,

    -- Dimensioni
    Descrizione        VARCHAR(50),
    ClasseDisp        INT,
    Attiva        BIT


    -- Constraint
    CONSTRAINT PK_CausaliMicrofermoMacchina_CausaleMicroFermoMacchina PRIMARY KEY CLUSTERED (
        ID
    )
);

END;
GO

