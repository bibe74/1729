CREATE PROCEDURE MSE.usp_Create_tbl_segnalazioni_Segnalazioni
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MSE.tbl_segnalazioni_Segnalazioni (
    -- Chiavi
    ID        INT NOT NULL,

    -- Dimensioni
    data        DATE,
    sigla        NVARCHAR(50),
    codiceCliente        NVARCHAR(6),
    bolla_n        NVARCHAR(50),
    bolla_del        DATE,
    finitura_altro        NVARCHAR(150),
    Company        CHAR(4),
    DataChiusuraSegnalazione        DATE,
    NumeroOrdineAX        NVARCHAR(20)


    -- Constraint
    CONSTRAINT PK_tbl_segnalazioni_Segnalazioni PRIMARY KEY CLUSTERED (
        ID
    )
);

END;
GO

