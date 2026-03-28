CREATE TABLE [MRDA].[Turni_TurnoAssemblaggio] (
    [ID]        NVARCHAR (50) NOT NULL,
    [OraInizio] NCHAR (10)    NULL,
    [OraFine]   NCHAR (10)    NULL
);
GO

ALTER TABLE [MRDA].[Turni_TurnoAssemblaggio]
    ADD CONSTRAINT [PK_Turni_TurnoAssemblaggio] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

