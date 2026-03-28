CREATE TABLE [METRAPQ].[tblControlloProfilatiEstrusi_Colate] (
    [ID]                          BIGINT         NOT NULL,
    [HistoricalHashKey]           VARBINARY (20) NULL,
    [ChangeHashKey]               VARBINARY (20) NULL,
    [InsertDatetime]              DATETIME       NOT NULL,
    [UpdateDatetime]              DATETIME       NOT NULL,
    [IsDeleted]                   BIT            NULL,
    [IDControlloProfilatiEstrusi] BIGINT         NULL,
    [Colata]                      NVARCHAR (50)  NULL,
    [Lega]                        NVARCHAR (50)  NULL
);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_METRAPQ_tblControlloProfilatiEstrusi_Colate_BusinessKey]
    ON [METRAPQ].[tblControlloProfilatiEstrusi_Colate]([ID] ASC);
GO

ALTER TABLE [METRAPQ].[tblControlloProfilatiEstrusi_Colate]
    ADD CONSTRAINT [PK_METRAPQ_tblControlloProfilatiEstrusi_Colate] PRIMARY KEY CLUSTERED ([UpdateDatetime] ASC, [ID] ASC);
GO

