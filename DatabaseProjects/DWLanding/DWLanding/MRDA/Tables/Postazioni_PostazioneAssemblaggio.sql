CREATE TABLE [MRDA].[Postazioni_PostazioneAssemblaggio] (
    [ID]            NVARCHAR (50) NOT NULL,
    [Descrizione]   NVARCHAR (50) NULL,
    [WrkCtrId]      NVARCHAR (20) NULL,
    [GroupWrkCtrId] NVARCHAR (20) NULL,
    [Test]          BIT           NULL
);
GO

ALTER TABLE [MRDA].[Postazioni_PostazioneAssemblaggio]
    ADD CONSTRAINT [PK_Postazioni_PostazioneAssemblaggio] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

