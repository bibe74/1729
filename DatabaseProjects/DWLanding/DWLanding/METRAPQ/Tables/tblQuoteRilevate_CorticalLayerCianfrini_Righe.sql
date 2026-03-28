CREATE TABLE [METRAPQ].[tblQuoteRilevate_CorticalLayerCianfrini_Righe] (
    [ID]                          BIGINT          NOT NULL,
    [HistoricalHashKey]           VARBINARY (20)  NULL,
    [ChangeHashKey]               VARBINARY (20)  NULL,
    [InsertDatetime]              DATETIME        NOT NULL,
    [UpdateDatetime]              DATETIME        NOT NULL,
    [IsDeleted]                   BIT             NULL,
    [IDTestata]                   BIGINT          NULL,
    [IDQuoteRilevate]             NCHAR (10)      NULL,
    [Posizione]                   CHAR (1)        NULL,
    [UrlImmagineMacrografiaTesta] NVARCHAR (500)  NULL,
    [UrlImmagineMacrografiaCoda]  NVARCHAR (500)  NULL,
    [MisuraTesta]                 NUMERIC (15, 2) NULL,
    [MisuraCoda]                  NUMERIC (15, 2) NULL,
    [Tolleranza]                  NUMERIC (15, 2) NULL,
    [IDUtente]                    BIGINT          NULL,
    [DataOraInserimento]          DATETIME        NULL
);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_METRAPQ_tblQuoteRilevate_CorticalLayerCianfrini_Righe_BusinessKey]
    ON [METRAPQ].[tblQuoteRilevate_CorticalLayerCianfrini_Righe]([ID] ASC);
GO

ALTER TABLE [METRAPQ].[tblQuoteRilevate_CorticalLayerCianfrini_Righe]
    ADD CONSTRAINT [PK_METRAPQ_tblQuoteRilevate_CorticalLayerCianfrini_Righe] PRIMARY KEY CLUSTERED ([UpdateDatetime] ASC, [ID] ASC);
GO

