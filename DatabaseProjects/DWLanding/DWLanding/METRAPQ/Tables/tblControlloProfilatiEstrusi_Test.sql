CREATE TABLE [METRAPQ].[tblControlloProfilatiEstrusi_Test] (
    [ID]                          BIGINT         NOT NULL,
    [HistoricalHashKey]           VARBINARY (20) NULL,
    [ChangeHashKey]               VARBINARY (20) NULL,
    [InsertDatetime]              DATETIME       NOT NULL,
    [UpdateDatetime]              DATETIME       NOT NULL,
    [IsDeleted]                   BIT            NULL,
    [IDControlloProfilatiEstrusi] BIGINT         NULL,
    [IDTest]                      BIGINT         NULL,
    [IDClassificazioneTest]       NVARCHAR (50)  NULL,
    [Metodo]                      NVARCHAR (200) NULL,
    [FrequenzaCampionatura]       NVARCHAR (200) NULL,
    [FrequenzaProduzione]         NVARCHAR (200) NULL,
    [CriterioDiAccessibilita]     NVARCHAR (200) NULL,
    [Note]                        NVARCHAR (500) NULL,
    [DateInsert]                  DATETIME       NULL
);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_METRAPQ_tblControlloProfilatiEstrusi_Test_BusinessKey]
    ON [METRAPQ].[tblControlloProfilatiEstrusi_Test]([ID] ASC);
GO

ALTER TABLE [METRAPQ].[tblControlloProfilatiEstrusi_Test]
    ADD CONSTRAINT [PK_METRAPQ_tblControlloProfilatiEstrusi_Test] PRIMARY KEY CLUSTERED ([UpdateDatetime] ASC, [ID] ASC);
GO

