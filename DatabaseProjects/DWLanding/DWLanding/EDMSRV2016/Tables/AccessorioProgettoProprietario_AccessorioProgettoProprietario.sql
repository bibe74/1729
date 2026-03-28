CREATE TABLE [EDMSRV2016].[AccessorioProgettoProprietario_AccessorioProgettoProprietario] (
    [Accessorio_Codice]               NVARCHAR (15)  NOT NULL,
    [Accessorio_ProgettoProprietario] NVARCHAR (255) NOT NULL
);
GO

ALTER TABLE [EDMSRV2016].[AccessorioProgettoProprietario_AccessorioProgettoProprietario]
    ADD CONSTRAINT [PK_EDMSRV2016_AccessorioProgettoProprietario_AccessorioProgettoProprietario] PRIMARY KEY CLUSTERED ([Accessorio_Codice] ASC) WITH (FILLFACTOR = 100);
GO

