CREATE TABLE [METRAPQ].[Statoavanzamento_RevisioniMatrici] (
    [N°]                       INT           NOT NULL,
    [Codice Metra]             NVARCHAR (20) NULL,
    [Barra matrice]            SMALLINT      NULL,
    [CodiceBarraMatrice]       NVARCHAR (20) NULL,
    [Revisione]                INT           NULL,
    [DataRevisione]            DATE          NULL,
    [TipoAzione]               NVARCHAR (20) NULL,
    [Arrivo previsto matrice]  DATE          NULL,
    [Arrivo effettivo matrice] DATE          NULL,
    [Ordine matrice]           NVARCHAR (20) NULL,
    [NumeroOrdineFornitore]    NVARCHAR (20) NULL
);
GO

ALTER TABLE [METRAPQ].[Statoavanzamento_RevisioniMatrici]
    ADD CONSTRAINT [PK_statoavanzamento_RevisioniMatrici] PRIMARY KEY CLUSTERED ([N°] ASC);
GO

