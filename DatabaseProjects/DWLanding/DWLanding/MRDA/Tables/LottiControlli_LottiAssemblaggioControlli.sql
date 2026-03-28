CREATE TABLE [MRDA].[LottiControlli_LottiAssemblaggioControlli] (
    [ID]                INT        NOT NULL,
    [IDLotto]           INT        NOT NULL,
    [Ts]                DATETIME   NULL,
    [NumeroBarra]       INT        NULL,
    [PlanaritaConforme] BIT        NULL,
    [ProvaT_Grezzo]     FLOAT (53) NULL,
    [ProvaT_Grezzo2]    FLOAT (53) NULL,
    [ProvaT_DopoForno]  FLOAT (53) NULL,
    [ProvaQ_Grezzo]     FLOAT (53) NULL,
    [ProvaQ_Lunghezza]  FLOAT (53) NULL,
    [ProvaQ_Misura]     FLOAT (53) NULL,
    [ProvaQ_DopoForno]  FLOAT (53) NULL
);
GO

ALTER TABLE [MRDA].[LottiControlli_LottiAssemblaggioControlli]
    ADD CONSTRAINT [PK_LottiControlli_LottiAssemblaggioControlli] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

