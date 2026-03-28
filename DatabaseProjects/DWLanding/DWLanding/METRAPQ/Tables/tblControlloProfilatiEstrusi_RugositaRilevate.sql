CREATE TABLE [METRAPQ].[tblControlloProfilatiEstrusi_RugositaRilevate] (
    [ID]                          BIGINT          NOT NULL,
    [HistoricalHashKey]           VARBINARY (20)  NULL,
    [ChangeHashKey]               VARBINARY (20)  NULL,
    [InsertDatetime]              DATETIME        NOT NULL,
    [UpdateDatetime]              DATETIME        NOT NULL,
    [IsDeleted]                   BIT             NULL,
    [IDControlloProfilatiEstrusi] BIGINT          NULL,
    [dataRiferimento]             DATETIME        NULL,
    [QuotaNumero]                 INT             NULL,
    [CodiceMetra]                 NVARCHAR (12)   NULL,
    [Ra]                          NUMERIC (18, 2) NULL,
    [Rt]                          NUMERIC (18, 2) NULL,
    [Rz]                          NUMERIC (18, 2) NULL,
    [Rmax]                        NUMERIC (18, 2) NULL
);
GO

ALTER TABLE [METRAPQ].[tblControlloProfilatiEstrusi_RugositaRilevate]
    ADD CONSTRAINT [PK_METRAPQ_tblControlloProfilatiEstrusi_RugositaRilevate] PRIMARY KEY CLUSTERED ([UpdateDatetime] ASC, [ID] ASC);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_METRAPQ_tblControlloProfilatiEstrusi_RugositaRilevate_BusinessKey]
    ON [METRAPQ].[tblControlloProfilatiEstrusi_RugositaRilevate]([ID] ASC);
GO

