CREATE TABLE [MRDA].[CausaliProdRidotta_CausaleProduzioneRidotta] (
    [ID]          INT           NOT NULL,
    [Descrizione] NVARCHAR (50) NOT NULL
);
GO

ALTER TABLE [MRDA].[CausaliProdRidotta_CausaleProduzioneRidotta]
    ADD CONSTRAINT [PK_CausaliProdRidotta_CausaleProduzioneRidotta] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

