CREATE TABLE [MERIDIANSQL].[MetraProgettazione_Accessori_Progetti_ProgettoAccessori] (
    [ID]                                       INT              NOT NULL,
    [Accessorio_Codice]                        NVARCHAR (15)    NOT NULL,
    [Progetto_Numero]                          NVARCHAR (100)   NOT NULL,
    [Progetto_Sospeso]                         BIT              NULL,
    [REVISIONDATE]                             DATE             NULL,
    [REVISIONUSER]                             NVARCHAR (50)    NULL,
    [Fornitore_Codice]                         NVARCHAR (255)   NULL,
    [Fornitore_RagioneSociale]                 NVARCHAR (255)   NULL,
    [Fornitore_Email]                          NVARCHAR (255)   NULL,
    [Progetto_CodiceRiferimentoFornitore]      NVARCHAR (255)   NULL,
    [Progetto_ProprietaStampo]                 NVARCHAR (255)   NULL,
    [Progetto_QtaRichiesta]                    NVARCHAR (255)   NULL,
    [Progetto_Scatola]                         NVARCHAR (255)   NULL,
    [Progetto_QtaMinimaVendita]                BIGINT           NULL,
    [Progetto_NPezziLottoMinimo]               BIGINT           NULL,
    [Progetto_Costo]                           DECIMAL (28, 12) NULL,
    [Progetto_Ammortamenti]                    DECIMAL (28, 12) NULL,
    [Progetto_CostoUnitario]                   DECIMAL (28, 12) NULL,
    [Progetto_IndiceMaggiorazioneCosto]        DECIMAL (28, 12) NULL,
    [Progetto_ParzialeCosto]                   DECIMAL (28, 12) NULL,
    [Progetto_AmmortamentoUnitario]            DECIMAL (28, 12) NULL,
    [Progetto_CostoAmmortamentoUnitario]       DECIMAL (28, 12) NULL,
    [Progetto_IndiceMaggiorazioneAmmortamento] DECIMAL (28, 12) NULL,
    [Progetto_ParzialeAmmortamento]            DECIMAL (28, 12) NULL
);
GO

ALTER TABLE [MERIDIANSQL].[MetraProgettazione_Accessori_Progetti_ProgettoAccessori]
    ADD CONSTRAINT [PK_MetraProgettazione_Accessori_Progetti_ProgettoAccessori] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

