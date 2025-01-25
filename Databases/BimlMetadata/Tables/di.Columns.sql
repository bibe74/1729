CREATE TABLE [di].[Columns]
(
[ColumnID] [int] NOT NULL IDENTITY(1, 1),
[TableID] [int] NOT NULL,
[ColumnName] [sys].[sysname] NOT NULL,
[ColumnDataType] [sys].[sysname] NOT NULL,
[ColumnMaxLength] [int] NULL,
[ColumnIsIdentity] [bit] NOT NULL CONSTRAINT [DF_di_Columns_ColumnIsIdentity] DEFAULT ((0)),
[ColumnPrecision] [int] NULL,
[ColumnScale] [int] NULL,
[IsNullable] [bit] NULL,
[IsIdentity] [bit] NULL,
[RefreshMetadata] [int] NULL CONSTRAINT [DF_Columns_RefreshMetadata] DEFAULT ((-1)),
[GenerateBimlFlag] [bit] NULL,
[ColumnAliasName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ColumnConvertDataType] [sys].[sysname] NULL,
[ColumnConvertMaxLength] [int] NULL,
[ColumnConvertPrecision] [int] NULL,
[ColumnConvertScale] [int] NULL,
[DateAdded] [datetime] NULL CONSTRAINT [DF_Columns_DateAdded] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [di].[Columns] ADD CONSTRAINT [PK_di_Columns] PRIMARY KEY CLUSTERED  ([ColumnID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Columns_ColumnName] ON [di].[Columns] ([ColumnName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Columns_TableID] ON [di].[Columns] ([TableID]) ON [PRIMARY]
GO
ALTER TABLE [di].[Columns] ADD CONSTRAINT [FK_Columns_Tables_TableID] FOREIGN KEY ([TableID]) REFERENCES [di].[Tables] ([TableID])
GO
