CREATE TABLE [di].[RefreshMetadataStates]
(
[RefreshMetadataStateID] [int] NOT NULL,
[RefreshMetadataStateName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateAdded] [datetime] NULL CONSTRAINT [DF_RefreshMetadataStates_DateAdded] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [di].[RefreshMetadataStates] ADD CONSTRAINT [PK_RefreshMetadataStates] PRIMARY KEY CLUSTERED  ([RefreshMetadataStateID]) ON [PRIMARY]
GO
