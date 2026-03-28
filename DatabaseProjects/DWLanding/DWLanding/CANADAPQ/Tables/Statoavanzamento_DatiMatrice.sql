CREATE TABLE [CANADAPQ].[Statoavanzamento_DatiMatrice] (
    [PKDatiMatrice]             INT           NOT NULL,
    [DataScheda]                DATE          NULL,
    [CodiceMatrice]             NVARCHAR (20) NULL,
    [BarraMatrice]              SMALLINT      NULL,
    [CodiceBarraMatrice]        NVARCHAR (20) NULL,
    [IsBenestareInternoMatrice] BIT           NULL,
    [DataArrivoPrevistoMatrice] DATE          NULL,
    [OrdineMatrice]             NVARCHAR (20) NULL
);
GO

ALTER TABLE [CANADAPQ].[Statoavanzamento_DatiMatrice]
    ADD CONSTRAINT [PK_statoavanzamento_DatiMatrice] PRIMARY KEY CLUSTERED ([PKDatiMatrice] ASC);
GO

