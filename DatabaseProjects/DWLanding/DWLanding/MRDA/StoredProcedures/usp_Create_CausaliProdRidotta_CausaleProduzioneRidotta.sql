
CREATE PROCEDURE MRDA.usp_Create_CausaliProdRidotta_CausaleProduzioneRidotta
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MRDA.CausaliProdRidotta_CausaleProduzioneRidotta (
    -- Chiavi
    ID        INT NOT NULL,

    -- Dimensioni
    Descrizione        NVARCHAR(50) NOT NULL


    -- Constraint
    CONSTRAINT PK_CausaliProdRidotta_CausaleProduzioneRidotta PRIMARY KEY CLUSTERED (
        ID
    )
);

END;
GO

