CREATE TABLE [IRDP].[Presse_Pressa] (
    [ID]            CHAR (3)       NOT NULL,
    [IDPressaAs400] CHAR (2)       NULL,
    [Descrizione]   NVARCHAR (100) NULL
);
GO

ALTER TABLE [IRDP].[Presse_Pressa]
    ADD CONSTRAINT [PK_Presse_Pressa] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

