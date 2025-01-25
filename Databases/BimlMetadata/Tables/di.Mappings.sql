CREATE TABLE [di].[Mappings]
(
[MappingID] [int] NOT NULL IDENTITY(1, 1),
[SourceColumnID] [int] NULL,
[DestinationColumnID] [int] NULL,
[IsColumnBusinessKey] [bit] NOT NULL CONSTRAINT [DF_di_Mappings_IsColumnBusinessKey] DEFAULT ((0)),
[IsETLInstrumentation] [bit] NOT NULL CONSTRAINT [DF_di_Mappings_IsETLInstrumentation] DEFAULT ((0)),
[DerivedExpression] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateAdded] [datetime] NULL CONSTRAINT [DF_Mappings_DateAdded] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [di].[Mappings] ADD CONSTRAINT [PK_di_Mappings] PRIMARY KEY CLUSTERED  ([MappingID]) ON [PRIMARY]
GO
ALTER TABLE [di].[Mappings] ADD CONSTRAINT [FK_di_Mappings_Columns_Destination] FOREIGN KEY ([DestinationColumnID]) REFERENCES [di].[Columns] ([ColumnID])
GO
ALTER TABLE [di].[Mappings] ADD CONSTRAINT [FK_di_Mappings_Columns_Source] FOREIGN KEY ([SourceColumnID]) REFERENCES [di].[Columns] ([ColumnID])
GO
