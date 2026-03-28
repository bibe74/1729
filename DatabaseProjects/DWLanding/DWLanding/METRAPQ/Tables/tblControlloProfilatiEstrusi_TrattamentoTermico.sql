CREATE TABLE [METRAPQ].[tblControlloProfilatiEstrusi_TrattamentoTermico] (
    [ID]                          BIGINT          NOT NULL,
    [HistoricalHashKey]           VARBINARY (20)  NULL,
    [ChangeHashKey]               VARBINARY (20)  NULL,
    [InsertDatetime]              DATETIME        NOT NULL,
    [UpdateDatetime]              DATETIME        NOT NULL,
    [IsDeleted]                   BIT             NULL,
    [IDControlloProfilatiEstrusi] BIGINT          NULL,
    [NumeroForno]                 NVARCHAR (10)   NULL,
    [DataTrattamento]             SMALLDATETIME   NULL,
    [NumeroInfornata]             INT             NULL,
    [ProvaDiPiega]                NVARCHAR (20)   NULL,
    [DurezzaMax]                  NUMERIC (18, 2) NULL,
    [DurezzaMin]                  NUMERIC (18, 2) NULL,
    [Durometro]                   NVARCHAR (40)   NULL,
    [Rm]                          NUMERIC (18, 2) NULL,
    [Rp02]                        NUMERIC (18, 2) NULL,
    [A]                           NUMERIC (18, 2) NULL,
    [MacchinaTrazione]            NVARCHAR (20)   NULL,
    [operatore]                   NVARCHAR (100)  NULL
);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_METRAPQ_tblControlloProfilatiEstrusi_TrattamentoTermico_BusinessKey]
    ON [METRAPQ].[tblControlloProfilatiEstrusi_TrattamentoTermico]([ID] ASC);
GO

ALTER TABLE [METRAPQ].[tblControlloProfilatiEstrusi_TrattamentoTermico]
    ADD CONSTRAINT [PK_METRAPQ_tblControlloProfilatiEstrusi_TrattamentoTermico] PRIMARY KEY CLUSTERED ([UpdateDatetime] ASC, [ID] ASC);
GO

