
CREATE PROCEDURE MRDP.usp_Create_CaricamentoBillettePressa_Carico_CaricoBillette
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDP.CaricamentoBillettePressa_Carico_CaricoBillette (
    -- Chiavi
    ID        BIGINT NOT NULL,

    -- Dimensioni
    Ingresso        CHAR(30)


    -- Constraint
    CONSTRAINT PK_CaricamentoBillettePressa_Carico_CaricoBillette PRIMARY KEY CLUSTERED (
        ID
    )
);

END;
GO

