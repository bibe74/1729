CREATE TABLE [MRDP].[Presse_Pressa] (
    [ID]            CHAR (3)       NOT NULL,
    [IDPressaAs400] CHAR (2)       NOT NULL,
    [Descrizione]   NVARCHAR (100) NOT NULL
);
GO

ALTER TABLE [MRDP].[Presse_Pressa]
    ADD CONSTRAINT [PK_Presse_Pressa] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

