CREATE TABLE [audit].[EventLog] (
    [PKEventLog]                BIGINT         IDENTITY (1, 1) NOT NULL,
    [EventTimeStamp]            DATETIME       NOT NULL,
    [IsElaborationStart]        BIT            NOT NULL,
    [PKEventSubElaboration]     BIGINT         NULL,
    [LogMessage]                NVARCHAR (255) NOT NULL,
    [NumberOfRows]              INT            NULL,
    [TimeElapsedElaboration]    INT            NULL,
    [TimeElapsedSubElaboration] INT            NULL,
    [TimeElapsedInstruction]    INT            NULL
);
GO

ALTER TABLE [audit].[EventLog]
    ADD CONSTRAINT [PK_EventLog] PRIMARY KEY CLUSTERED ([PKEventLog] ASC);
GO

ALTER TABLE [audit].[EventLog]
    ADD CONSTRAINT [DFT_EventLog_IsElaborationStart] DEFAULT ((0)) FOR [IsElaborationStart];
GO

ALTER TABLE [audit].[EventLog]
    ADD CONSTRAINT [DFT_EventLog_EventTimeStamp] DEFAULT (getdate()) FOR [EventTimeStamp];
GO

