CREATE TABLE [MERIDIANSQL].[MetraProgettazione_Accessori_OfferteFornitori_OfferteAccessori] (
    [ID]                    BIGINT           NOT NULL,
    [IDFornitore]           NVARCHAR (20)    NOT NULL,
    [CodiceAccessorio]      NVARCHAR (20)    NOT NULL,
    [DataOfferta]           DATE             NOT NULL,
    [Lotto]                 INT              NULL,
    [ProprietaAttrezzatura] NVARCHAR (50)    NULL,
    [Progetto]              NVARCHAR (50)    NOT NULL,
    [Documento]             NVARCHAR (50)    NULL,
    [Revisione]             NVARCHAR (10)    NULL,
    [RevisioneSuperata]     BIT              NULL,
    [UnitaMisura]           NVARCHAR (10)    NULL,
    [Scatola]               NVARCHAR (255)   NULL,
    [QtaMinimaVendita]      BIGINT           NULL,
    [Peso]                  DECIMAL (28, 12) NULL,
    [Costo]                 DECIMAL (28, 12) NULL,
    [CostoAttrezzatura]     DECIMAL (28, 12) NULL
);
GO

ALTER TABLE [MERIDIANSQL].[MetraProgettazione_Accessori_OfferteFornitori_OfferteAccessori]
    ADD CONSTRAINT [PK_MetraProgettazione_Accessori_OfferteFornitori_OfferteAccessori] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

