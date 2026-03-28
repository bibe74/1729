
CREATE PROCEDURE MRDA.usp_Create_LottiFermi_LottiAssemblaggioFermi
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDA.LottiFermi_LottiAssemblaggioFermi (
    -- Chiavi
    ID        INT NOT NULL,

    -- Dimensioni
    IDLotto        INT NOT NULL,
    IDCausaleFermo        INT,
    Inizio_Ts        DATETIME,
    Fine_Ts        DATETIME,
    Tipo        CHAR(1),
    IDPostazione        NVARCHAR(100)


    -- Constraint
    CONSTRAINT PK_LottiFermi_LottiAssemblaggioFermi PRIMARY KEY CLUSTERED (
        ID
    )
);

END;
GO

