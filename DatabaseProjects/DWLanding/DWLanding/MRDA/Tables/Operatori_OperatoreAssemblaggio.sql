CREATE TABLE [MRDA].[Operatori_OperatoreAssemblaggio] (
    [ID]      NVARCHAR (10) NOT NULL,
    [Cognome] NVARCHAR (50) NOT NULL,
    [Nome]    NVARCHAR (50) NULL
);
GO

ALTER TABLE [MRDA].[Operatori_OperatoreAssemblaggio]
    ADD CONSTRAINT [PK_Operatori_OperatoreAssemblaggio] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

