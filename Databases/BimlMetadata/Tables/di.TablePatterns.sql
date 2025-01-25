CREATE TABLE [di].[TablePatterns]
(
[TablePatternID] [int] NOT NULL IDENTITY(1, 1),
[TableID] [int] NOT NULL,
[PatternID] [int] NOT NULL,
[DateAdded] [datetime] NULL CONSTRAINT [DF_TablePatterns_DateAdded] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [di].[TablePatterns] ADD CONSTRAINT [PK_TablePatterns] PRIMARY KEY CLUSTERED  ([TablePatternID]) ON [PRIMARY]
GO
ALTER TABLE [di].[TablePatterns] ADD CONSTRAINT [FK_TablePatterns_Pattern_PatternID] FOREIGN KEY ([PatternID]) REFERENCES [di].[Patterns] ([PatternID])
GO
ALTER TABLE [di].[TablePatterns] ADD CONSTRAINT [FK_TablePatterns_Table_TableID] FOREIGN KEY ([TableID]) REFERENCES [di].[Tables] ([TableID])
GO
