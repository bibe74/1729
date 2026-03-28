CREATE TABLE [METRAPQ].[tblControlloProfilatiEstrusi_QuoteRilevate] (
    [ID]                          BIGINT          NOT NULL,
    [HistoricalHashKey]           VARBINARY (20)  NULL,
    [ChangeHashKey]               VARBINARY (20)  NULL,
    [InsertDatetime]              DATETIME        NOT NULL,
    [UpdateDatetime]              DATETIME        NOT NULL,
    [IsDeleted]                   BIT             NULL,
    [IDControlloProfilatiEstrusi] BIGINT          NOT NULL,
    [dataRiferimento]             DATETIME        NULL,
    [QuotaNumero]                 INT             NOT NULL,
    [CodiceMetra]                 NVARCHAR (12)   NULL,
    [Revisione]                   INT             NULL,
    [Descrizione]                 NVARCHAR (50)   NULL,
    [QuotaNominale]               NUMERIC (18, 2) NULL,
    [TolleranzaLow]               NUMERIC (18, 2) NULL,
    [TolleranzaHigh]              NUMERIC (18, 2) NULL,
    [uscita1]                     NUMERIC (18, 2) NULL,
    [uscita2]                     NUMERIC (18, 2) NULL,
    [uscita3]                     NUMERIC (18, 2) NULL,
    [uscita4]                     NUMERIC (18, 2) NULL,
    [uscita5]                     NUMERIC (18, 2) NULL,
    [uscita6]                     NUMERIC (18, 2) NULL,
    [uscita7]                     NUMERIC (18, 2) NULL,
    [uscita8]                     NUMERIC (18, 2) NULL,
    [uscita9]                     NUMERIC (18, 2) NULL,
    [uscita10]                    NUMERIC (18, 2) NULL,
    [uscita11]                    NUMERIC (18, 2) NULL,
    [uscita12]                    NUMERIC (18, 2) NULL,
    [condizione]                  CHAR (1)        NULL,
    [sequenza]                    NVARCHAR (10)   NULL,
    [IDClassificazioneQuota]      NVARCHAR (50)   NULL,
    [tipo]                        NVARCHAR (50)   NULL
);
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_METRAPQ_tblControlloProfilatiEstrusi_QuoteRilevate_BusinessKey]
    ON [METRAPQ].[tblControlloProfilatiEstrusi_QuoteRilevate]([ID] ASC);
GO

ALTER TABLE [METRAPQ].[tblControlloProfilatiEstrusi_QuoteRilevate]
    ADD CONSTRAINT [PK_METRAPQ_tblControlloProfilatiEstrusi_QuoteRilevate] PRIMARY KEY CLUSTERED ([UpdateDatetime] ASC, [ID] ASC);
GO

