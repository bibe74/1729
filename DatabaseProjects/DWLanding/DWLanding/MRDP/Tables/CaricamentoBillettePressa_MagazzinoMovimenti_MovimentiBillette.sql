CREATE TABLE [MRDP].[CaricamentoBillettePressa_MagazzinoMovimenti_MovimentiBillette] (
    [ID]                BIGINT        NOT NULL,
    [Colata]            NVARCHAR (40) NOT NULL,
    [TipoAzione]        NVARCHAR (40) NULL,
    [DataAzione]        DATETIME      NULL,
    [IDScaricoBilletta] BIGINT        NULL,
    [IDCaricoBilletta]  BIGINT        NULL,
    [Qta]               INT           NULL
);
GO

ALTER TABLE [MRDP].[CaricamentoBillettePressa_MagazzinoMovimenti_MovimentiBillette]
    ADD CONSTRAINT [PK_CaricamentoBillettePressa_MagazzinoMovimenti_MovimentiBillette] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

