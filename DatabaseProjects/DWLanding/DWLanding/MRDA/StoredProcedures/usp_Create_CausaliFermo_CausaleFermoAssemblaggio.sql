
CREATE PROCEDURE MRDA.usp_Create_CausaliFermo_CausaleFermoAssemblaggio
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDA.CausaliFermo_CausaleFermoAssemblaggio (
    -- Chiavi
    ID        INT NOT NULL,

    -- Dimensioni
    Descrizione        NVARCHAR(50) NOT NULL,
    Attrezzaggio        BIT NOT NULL,
    Produzione        BIT NOT NULL,
    Disponibilita        BIT NOT NULL,
    EscludiDaCalcoloResa        BIT NOT NULL


    -- Constraint
    CONSTRAINT PK_CausaliFermo_CausaleFermoAssemblaggio PRIMARY KEY CLUSTERED (
        ID
    )
);

END;
GO

