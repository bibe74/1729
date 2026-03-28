CREATE TABLE [METRADTE].[MetraDTE_AttivitaPreliminariLogModifiche_Modifiche] (
    [ID]                  BIGINT          NOT NULL,
    [IDSchedaPreliminare] BIGINT          NULL,
    [dataModifica]        DATE            NULL,
    [IDUtenteModifica]    BIGINT          NULL,
    [valoreCampo]         DECIMAL (18, 2) NULL
);
GO

ALTER TABLE [METRADTE].[MetraDTE_AttivitaPreliminariLogModifiche_Modifiche]
    ADD CONSTRAINT [PK_MetraDTE_AttivitaPreliminariLogModifiche_Modifiche] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 100);
GO

