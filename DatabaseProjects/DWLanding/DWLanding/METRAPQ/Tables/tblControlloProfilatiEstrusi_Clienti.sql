CREATE TABLE [METRAPQ].[tblControlloProfilatiEstrusi_Clienti] (
    [ID]                          BIGINT         NOT NULL,
    [HistoricalHashKey]           VARBINARY (20) NULL,
    [ChangeHashKey]               VARBINARY (20) NULL,
    [InsertDatetime]              DATETIME       NOT NULL,
    [UpdateDatetime]              DATETIME       NOT NULL,
    [IsDeleted]                   BIT            NULL,
    [IDControlloProfilatiEstrusi] BIGINT         NULL,
    [CodiceCliente]               NVARCHAR (50)  NULL,
    [Cliente]                     NVARCHAR (150) NULL,
    [LegaTrattamento]             NVARCHAR (50)  NULL,
    [Trattamento]                 NVARCHAR (50)  NULL
);
GO

ALTER TABLE [METRAPQ].[tblControlloProfilatiEstrusi_Clienti]
    ADD CONSTRAINT [PK_METRAPQ_tblControlloProfilatiEstrusi_Clienti] PRIMARY KEY CLUSTERED ([UpdateDatetime] ASC, [ID] ASC);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_METRAPQ_tblControlloProfilatiEstrusi_Clienti_BusinessKey]
    ON [METRAPQ].[tblControlloProfilatiEstrusi_Clienti]([ID] ASC);
GO

