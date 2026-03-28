CREATE TABLE [MRDA].[LottiFermi_LottiAssemblaggioFermi] (
    [ID]             INT            NOT NULL,
    [IDLotto]        INT            NOT NULL,
    [IDCausaleFermo] INT            NULL,
    [Inizio_Ts]      DATETIME       NULL,
    [Fine_Ts]        DATETIME       NULL,
    [Tipo]           CHAR (1)       NULL,
    [IDPostazione]   NVARCHAR (100) NULL
);
GO

ALTER TABLE [MRDA].[LottiFermi_LottiAssemblaggioFermi]
    ADD CONSTRAINT [PK_LottiFermi_LottiAssemblaggioFermi] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

