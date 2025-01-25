CREATE TABLE [di].[Projects]
(
[ProjectID] [int] NOT NULL IDENTITY(1, 1),
[ProjectName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ProjectNotes] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateAdded] [datetime] NULL CONSTRAINT [DF_Projects_DateAdded] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [di].[Projects] ADD CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED  ([ProjectID]) ON [PRIMARY]
GO
