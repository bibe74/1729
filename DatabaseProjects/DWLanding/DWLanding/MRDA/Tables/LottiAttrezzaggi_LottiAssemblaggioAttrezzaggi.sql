CREATE TABLE [MRDA].[LottiAttrezzaggi_LottiAssemblaggioAttrezzaggi] (
    [ID]        INT      NOT NULL,
    [IDLotto]   INT      NOT NULL,
    [Inizio_Ts] DATETIME NULL,
    [Fine_Ts]   DATETIME NULL
);
GO

ALTER TABLE [MRDA].[LottiAttrezzaggi_LottiAssemblaggioAttrezzaggi]
    ADD CONSTRAINT [PK_LottiAttrezzaggi_LottiAssemblaggioAttrezzaggi] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

