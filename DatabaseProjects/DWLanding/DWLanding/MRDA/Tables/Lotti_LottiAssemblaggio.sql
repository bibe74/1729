CREATE TABLE [MRDA].[Lotti_LottiAssemblaggio] (
    [ID]                 INT           NOT NULL,
    [IDTurno]            NVARCHAR (50) NOT NULL,
    [IDPostazione]       NVARCHAR (50) NOT NULL,
    [IDCausaleChiusura]  INT           NULL,
    [NumeroLotto]        NVARCHAR (50) NOT NULL,
    [Campionatura]       BIT           NULL,
    [CodiceCra]          NVARCHAR (20) NULL,
    [CodiceArticolo]     NVARCHAR (20) NULL,
    [TsInizio]           DATETIME      NULL,
    [TsFine]             DATETIME      NULL,
    [Elab_Riconciliare]  BIT           NULL,
    [Elab_Riconciliato]  BIT           NULL,
    [Elab_Diagnostica]   CHAR (3)      NULL,
    [Elab_DiagnosticaTs] DATETIME      NULL
);
GO

ALTER TABLE [MRDA].[Lotti_LottiAssemblaggio]
    ADD CONSTRAINT [PK_Lotti_LottiAssemblaggio] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

