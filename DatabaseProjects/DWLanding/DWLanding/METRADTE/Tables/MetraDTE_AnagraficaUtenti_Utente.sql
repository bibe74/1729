CREATE TABLE [METRADTE].[MetraDTE_AnagraficaUtenti_Utente] (
    [ID]      BIGINT        NOT NULL,
    [Nome]    NVARCHAR (50) NULL,
    [Cognome] NVARCHAR (50) NULL
);
GO

ALTER TABLE [METRADTE].[MetraDTE_AnagraficaUtenti_Utente]
    ADD CONSTRAINT [PK_MetraDTE_AnagraficaUtenti_Utente] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

