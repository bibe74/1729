CREATE TABLE [METRAPQ].[tblQuoteRilevate_CorticalLayerCianfrini_Testata] (
    [ID]                         BIGINT         NOT NULL,
    [HistoricalHashKey]          VARBINARY (20) NULL,
    [ChangeHashKey]              VARBINARY (20) NULL,
    [InsertDatetime]             DATETIME       NOT NULL,
    [UpdateDatetime]             DATETIME       NOT NULL,
    [IsDeleted]                  BIT            NULL,
    [IDQuoteRilevate]            BIGINT         NOT NULL,
    [urlDisegnoTecnicoPosizioni] NVARCHAR (500) NULL,
    [CodiceArticolo]             NVARCHAR (50)  NULL,
    [DataOraInserimento]         DATETIME       NULL,
    [IDUtente]                   BIGINT         NULL
);
GO

ALTER TABLE [METRAPQ].[tblQuoteRilevate_CorticalLayerCianfrini_Testata]
    ADD CONSTRAINT [PK_METRAPQ_tblQuoteRilevate_CorticalLayerCianfrini_Testata] PRIMARY KEY CLUSTERED ([UpdateDatetime] ASC, [ID] ASC);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_METRAPQ_tblQuoteRilevate_CorticalLayerCianfrini_Testata_BusinessKey]
    ON [METRAPQ].[tblQuoteRilevate_CorticalLayerCianfrini_Testata]([ID] ASC);
GO

