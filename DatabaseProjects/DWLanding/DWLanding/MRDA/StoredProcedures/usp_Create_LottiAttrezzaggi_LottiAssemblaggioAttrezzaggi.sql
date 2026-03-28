
CREATE PROCEDURE MRDA.usp_Create_LottiAttrezzaggi_LottiAssemblaggioAttrezzaggi
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDA.LottiAttrezzaggi_LottiAssemblaggioAttrezzaggi (
    -- Chiavi
    ID        INT NOT NULL,

    -- Dimensioni
    IDLotto        INT NOT NULL,
    Inizio_Ts        DATETIME,
    Fine_Ts        DATETIME


    -- Constraint
    CONSTRAINT PK_LottiAttrezzaggi_LottiAssemblaggioAttrezzaggi PRIMARY KEY CLUSTERED (
        ID
    )
);

END;
GO

