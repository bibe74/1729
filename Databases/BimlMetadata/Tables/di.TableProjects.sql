CREATE TABLE [di].[TableProjects]
(
[TableProjectID] [int] NOT NULL IDENTITY(1, 1),
[TableID] [int] NOT NULL,
[ProjectID] [int] NOT NULL,
[DateAdded] [datetime] NULL CONSTRAINT [DF_TableProjects_DateAdded] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [di].[TableProjects] ADD CONSTRAINT [PK_TableProjects] PRIMARY KEY CLUSTERED  ([TableProjectID]) ON [PRIMARY]
GO
ALTER TABLE [di].[TableProjects] ADD CONSTRAINT [FK_TableProjects_Project_ProjectID] FOREIGN KEY ([ProjectID]) REFERENCES [di].[Projects] ([ProjectID])
GO
ALTER TABLE [di].[TableProjects] ADD CONSTRAINT [FK_TableProjects_Table_TableID] FOREIGN KEY ([TableID]) REFERENCES [di].[Tables] ([TableID])
GO
