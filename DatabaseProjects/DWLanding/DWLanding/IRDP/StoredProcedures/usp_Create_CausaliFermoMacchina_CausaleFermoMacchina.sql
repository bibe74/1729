
CREATE PROCEDURE IRDP.usp_Create_CausaliFermoMacchina_CausaleFermoMacchina
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE IRDP.CausaliFermoMacchina_CausaleFermoMacchina (
    -- Chiavi
    ID        SMALLINT NOT NULL,

    -- Dimensioni
    Descrizione        VARCHAR(50),
    ClasseDisp        INT,
    Attiva        BIT


    -- Constraint
    CONSTRAINT PK_CausaliFermoMacchina_CausaleFermoMacchina PRIMARY KEY CLUSTERED (
        ID
    )
);

END;
GO

