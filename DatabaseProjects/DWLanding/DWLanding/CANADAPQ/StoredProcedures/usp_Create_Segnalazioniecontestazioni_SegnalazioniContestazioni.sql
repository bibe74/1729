
CREATE PROCEDURE CANADAPQ.usp_Create_Segnalazioniecontestazioni_SegnalazioniContestazioni
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE CANADAPQ.Segnalazioniecontestazioni_SegnalazioniContestazioni (
    -- Chiavi
    Numero        INT NOT NULL,

    -- Dimensioni
    Data        DATE,
    codiceCliente        NVARCHAR(20),
    [Codice Metra]        NVARCHAR(20),
    FinituraCodice        NVARCHAR(10),
    LunghezzaBarra        DECIMAL(28, 12),
    CodiceConfigurato        NVARCHAR(20),
    [DDT/Fattura n°]        NVARCHAR(20),
    del        DATE,
    [Conferma d'ordine]        NVARCHAR(20),
    [Segnalazione/contestazione]        NVARCHAR(20),
    [Data indagine]        DATE,
    [Data chiusura]        DATE


    -- Constraint
    CONSTRAINT PK_Segnalazioniecontestazioni_SegnalazioniContestazioni PRIMARY KEY CLUSTERED (
        Numero
    )
);

END;
GO

