CREATE TABLE [di].[Patterns]
(
[PatternID] [int] NOT NULL IDENTITY(1, 1),
[PatternName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PatternNotes] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateAdded] [datetime] NULL CONSTRAINT [DF_Patterns_DateAdded] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [di].[Patterns] ADD CONSTRAINT [PK_Patterns] PRIMARY KEY CLUSTERED  ([PatternID]) ON [PRIMARY]
GO
