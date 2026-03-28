

CREATE PROCEDURE MRDP.usp_Create_CaricamentoBillettePressa_MagazzinoMovimenti_MovimentiBillette
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDP.CaricamentoBillettePressa_MagazzinoMovimenti_MovimentiBillette (
    -- Chiavi
    ID        BIGINT NOT NULL,

    -- Dimensioni
    Colata        NVARCHAR(40) NOT NULL,
    TipoAzione        NVARCHAR(40),
    DataAzione        DATETIME,
    IDScaricoBilletta        BIGINT,
    IDCaricoBilletta        BIGINT,

    -- Misure
    Qta        INT

    -- Constraint
    CONSTRAINT PK_CaricamentoBillettePressa_MagazzinoMovimenti_MovimentiBillette PRIMARY KEY CLUSTERED (
        ID
    )
);

END;
GO

