CREATE TABLE [METRAPQ].[tblControlloProfilatiEstrusi_ProduzioniEseguite] (
    [ID]                          BIGINT         NOT NULL,
    [HistoricalHashKey]           VARBINARY (20) NULL,
    [ChangeHashKey]               VARBINARY (20) NULL,
    [InsertDatetime]              DATETIME       NOT NULL,
    [UpdateDatetime]              DATETIME       NOT NULL,
    [IsDeleted]                   BIT            NULL,
    [IDControlloProfilatiEstrusi] BIGINT         NULL,
    [NumeroOrdine]                NVARCHAR (10)  NULL,
    [RigaOrdine]                  INT            NULL,
    [NBarreTagliate]              INT            NULL,
    [LunghezzaBarre]              INT            NULL
);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_METRAPQ_tblControlloProfilatiEstrusi_ProduzioniEseguite_BusinessKey]
    ON [METRAPQ].[tblControlloProfilatiEstrusi_ProduzioniEseguite]([ID] ASC);
GO

ALTER TABLE [METRAPQ].[tblControlloProfilatiEstrusi_ProduzioniEseguite]
    ADD CONSTRAINT [PK_METRAPQ_tblControlloProfilatiEstrusi_ProduzioniEseguite] PRIMARY KEY CLUSTERED ([UpdateDatetime] ASC, [ID] ASC);
GO

