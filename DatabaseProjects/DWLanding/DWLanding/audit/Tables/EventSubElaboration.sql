CREATE TABLE [audit].[EventSubElaboration] (
    [PKEventSubElaboration] BIGINT   IDENTITY (1, 1) NOT NULL,
    [TimeStart]             DATETIME NOT NULL
);
GO

ALTER TABLE [audit].[EventSubElaboration]
    ADD CONSTRAINT [PK_EventSubElaboration] PRIMARY KEY CLUSTERED ([PKEventSubElaboration] ASC) WITH (FILLFACTOR = 100);
GO

ALTER TABLE [audit].[EventSubElaboration]
    ADD CONSTRAINT [DFT_EventSubElaboration_TimeStart] DEFAULT (getdate()) FOR [TimeStart];
GO

