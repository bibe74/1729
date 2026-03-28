CREATE TABLE [METRAPQ].[tblQuoteRichieste_CorticalLayerCianfrini] (
    [ID]                 BIGINT          NOT NULL,
    [HistoricalHashKey]  VARBINARY (20)  NULL,
    [ChangeHashKey]      VARBINARY (20)  NULL,
    [InsertDatetime]     DATETIME        NOT NULL,
    [UpdateDatetime]     DATETIME        NOT NULL,
    [IsDeleted]          BIT             NULL,
    [IDQuoteRichieste]   BIGINT          NULL,
    [Posizione]          CHAR (1)        NULL,
    [Tolleranza]         NUMERIC (15, 2) NULL,
    [IDUtente]           BIGINT          NULL,
    [DataOraInserimento] DATETIME        NULL
);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_METRAPQ_tblQuoteRichieste_CorticalLayerCianfrini_BusinessKey]
    ON [METRAPQ].[tblQuoteRichieste_CorticalLayerCianfrini]([ID] ASC);
GO

ALTER TABLE [METRAPQ].[tblQuoteRichieste_CorticalLayerCianfrini]
    ADD CONSTRAINT [PK_METRAPQ_tblQuoteRichieste_CorticalLayerCianfrini] PRIMARY KEY CLUSTERED ([UpdateDatetime] ASC, [ID] ASC);
GO

