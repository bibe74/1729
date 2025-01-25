CREATE TABLE [di].[ConnectionCollection]
(
[ConnectionCollectionID] [int] NOT NULL IDENTITY(1, 1),
[ConnectionCollectionName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ConnectionCollectionDescription] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
