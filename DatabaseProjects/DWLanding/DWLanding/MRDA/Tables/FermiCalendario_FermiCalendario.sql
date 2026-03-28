CREATE TABLE [MRDA].[FermiCalendario_FermiCalendario] (
    [IDPostazione] NVARCHAR (50) NOT NULL,
    [TsStart]      DATETIME      NOT NULL,
    [TsStop]       DATETIME      NULL
);
GO

ALTER TABLE [MRDA].[FermiCalendario_FermiCalendario]
    ADD CONSTRAINT [PK_FermiCalendario_FermiCalendario] PRIMARY KEY CLUSTERED ([IDPostazione] ASC, [TsStart] ASC) WITH (FILLFACTOR = 100);
GO

