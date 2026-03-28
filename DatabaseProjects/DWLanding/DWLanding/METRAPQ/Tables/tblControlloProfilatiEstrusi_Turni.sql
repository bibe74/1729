CREATE TABLE [METRAPQ].[tblControlloProfilatiEstrusi_Turni] (
    [ID]                          BIGINT         NOT NULL,
    [HistoricalHashKey]           VARBINARY (20) NULL,
    [ChangeHashKey]               VARBINARY (20) NULL,
    [InsertDatetime]              DATETIME       NOT NULL,
    [UpdateDatetime]              DATETIME       NOT NULL,
    [IsDeleted]                   BIT            NULL,
    [IDControlloProfilatiEstrusi] BIGINT         NULL,
    [Turno]                       NVARCHAR (50)  NULL,
    [CodiceTurno]                 INT            NULL,
    [CapoPressa]                  NVARCHAR (50)  NULL,
    [ResponsabileDiLinea]         NVARCHAR (250) NULL
);
GO

ALTER TABLE [METRAPQ].[tblControlloProfilatiEstrusi_Turni]
    ADD CONSTRAINT [PK_METRAPQ_tblControlloProfilatiEstrusi_Turni] PRIMARY KEY CLUSTERED ([UpdateDatetime] ASC, [ID] ASC);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_METRAPQ_tblControlloProfilatiEstrusi_Turni_BusinessKey]
    ON [METRAPQ].[tblControlloProfilatiEstrusi_Turni]([ID] ASC);
GO

