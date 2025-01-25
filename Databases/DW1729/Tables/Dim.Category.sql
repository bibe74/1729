CREATE TABLE [Dim].[Category]
(
[CategoryKey] [int] NOT NULL IDENTITY(1, 1),
[CategoryName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsExtraConsulting] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Dim].[Category] ADD CONSTRAINT [PK_Dim_Category] PRIMARY KEY CLUSTERED  ([CategoryKey]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Dim_Category_CategoryName] ON [Dim].[Category] ([CategoryName]) ON [PRIMARY]
GO
