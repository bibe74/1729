CREATE TABLE [METRADTE].[MetraDTE_Attivita_AttivitaProgrammata] (
    [ID]                        BIGINT         NOT NULL,
    [IDSchedaPreliminare]       BIGINT         NULL,
    [incaricato]                NVARCHAR (50)  NULL,
    [attivita]                  NVARCHAR (100) NULL,
    [riferimentoCommessaNumero] NVARCHAR (250) NULL,
    [agenteTecnico]             NVARCHAR (255) NULL,
    [_IDUtenteInsert]           BIGINT         NULL,
    [ambito]                    NVARCHAR (50)  NULL
);
GO

ALTER TABLE [METRADTE].[MetraDTE_Attivita_AttivitaProgrammata]
    ADD CONSTRAINT [PK_MetraDTE_Attivita_AttivitaProgrammata] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

