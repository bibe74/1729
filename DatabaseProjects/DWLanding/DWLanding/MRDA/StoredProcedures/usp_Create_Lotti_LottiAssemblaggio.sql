
CREATE PROCEDURE MRDA.usp_Create_Lotti_LottiAssemblaggio
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDA.Lotti_LottiAssemblaggio (
    -- Chiavi
    ID        INT NOT NULL,

    -- Dimensioni
    IDTurno        NVARCHAR(50) NOT NULL,
    IDPostazione        NVARCHAR(50) NOT NULL,
    IDCausaleChiusura        INT,
    NumeroLotto        NVARCHAR(50) NOT NULL,
    Campionatura        BIT,
    CodiceCra        NVARCHAR(20),
    CodiceArticolo        NVARCHAR(20),
    TsInizio        DATETIME,
    TsFine        DATETIME,
    Elab_Riconciliare        BIT,
    Elab_Riconciliato        BIT,
    Elab_Diagnostica        CHAR(3),
    Elab_DiagnosticaTs        DATETIME


    -- Constraint
    CONSTRAINT PK_Lotti_LottiAssemblaggio PRIMARY KEY CLUSTERED (
        ID
    )
);

END;
GO

