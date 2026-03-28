CREATE TABLE [MRDP].[CaricamentoBillettePressa_Carico_CaricoBillette] (
    [ID]       BIGINT    NOT NULL,
    [Ingresso] CHAR (30) NULL
);
GO

ALTER TABLE [MRDP].[CaricamentoBillettePressa_Carico_CaricoBillette]
    ADD CONSTRAINT [PK_CaricamentoBillettePressa_Carico_CaricoBillette] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

