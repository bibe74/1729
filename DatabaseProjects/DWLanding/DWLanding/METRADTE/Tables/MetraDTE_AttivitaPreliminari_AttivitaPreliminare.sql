CREATE TABLE [METRADTE].[MetraDTE_AttivitaPreliminari_AttivitaPreliminare] (
    [ID]                            BIGINT         NOT NULL,
    [projectManager]                NVARCHAR (50)  NULL,
    [attivita]                      NVARCHAR (100) NULL,
    [aperta]                        BIT            NULL,
    [codiceCliente]                 NVARCHAR (50)  NULL,
    [riferimentoAttivitaUnivoco]    NVARCHAR (250) NULL,
    [personaRiferimentoRichiedente] NVARCHAR (250) NULL,
    [dataRicezioneEffettiva]        DATE           NULL,
    [dataChiusura]                  DATE           NULL,
    [_dataInsert]                   DATE           NULL,
    [_IDUtenteInsert]               BIGINT         NULL,
    [ambito]                        NVARCHAR (50)  NULL
);
GO

ALTER TABLE [METRADTE].[MetraDTE_AttivitaPreliminari_AttivitaPreliminare]
    ADD CONSTRAINT [PK_MetraDTE_AttivitaPreliminari_AttivitaPreliminare] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

