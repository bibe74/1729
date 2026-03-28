CREATE TABLE [MRDA].[Calendari_Calendario] (
    [IDPostazione] NVARCHAR (50) NOT NULL,
    [TransDate]    DATE          NOT NULL,
    [TsStart]      DATETIME      NOT NULL,
    [TsStop]       DATETIME      NOT NULL
);
GO

ALTER TABLE [MRDA].[Calendari_Calendario]
    ADD CONSTRAINT [PK_Calendari_Calendario] PRIMARY KEY CLUSTERED ([IDPostazione] ASC, [TransDate] ASC, [TsStart] ASC) WITH (FILLFACTOR = 100);
GO

