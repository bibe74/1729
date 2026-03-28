
CREATE PROCEDURE MRDA.usp_Create_LottiProduzioni_LottiAssemblaggioProduzioni
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDA.LottiProduzioni_LottiAssemblaggioProduzioni (
    -- Chiavi
    ID        INT NOT NULL,

    -- Dimensioni
    IDLotto        INT NOT NULL,
    Inizio_Ts        DATETIME,
    Fine_Ts        DATETIME,
    Qta        INT,
    NumeroPassate        INT,
    ItemId        NVARCHAR(20),
    ItemLength        INT,
    ProdRidotta        BIT,
    ProdRidotta_IDCausale        INT


    -- Constraint
    CONSTRAINT PK_LottiProduzioni_LottiAssemblaggioProduzioni PRIMARY KEY CLUSTERED (
        ID
    )
);

END;
GO

