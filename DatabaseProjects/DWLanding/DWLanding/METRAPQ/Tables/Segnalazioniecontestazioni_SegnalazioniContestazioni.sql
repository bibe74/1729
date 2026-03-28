CREATE TABLE [METRAPQ].[Segnalazioniecontestazioni_SegnalazioniContestazioni] (
    [Numero]                     INT              NOT NULL,
    [Data]                       DATE             NULL,
    [codiceCliente]              NVARCHAR (20)    NULL,
    [Codice Metra]               NVARCHAR (20)    NULL,
    [FinituraCodice]             NVARCHAR (10)    NULL,
    [LunghezzaBarra]             DECIMAL (28, 12) NULL,
    [CodiceConfigurato]          NVARCHAR (20)    NULL,
    [DDT/Fattura n°]             NVARCHAR (20)    NULL,
    [del]                        DATE             NULL,
    [Conferma d'ordine]          NVARCHAR (20)    NULL,
    [Segnalazione/contestazione] NVARCHAR (20)    NULL,
    [Data indagine]              DATE             NULL,
    [Data chiusura]              DATE             NULL
);
GO

ALTER TABLE [METRAPQ].[Segnalazioniecontestazioni_SegnalazioniContestazioni]
    ADD CONSTRAINT [PK_Segnalazioniecontestazioni_SegnalazioniContestazioni] PRIMARY KEY CLUSTERED ([Numero] ASC);
GO

