CREATE TABLE [di].[DataTypeMap]
(
[DataTypeMapID] [int] NOT NULL IDENTITY(1, 1),
[DataType] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DataTypeMapsTo] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MapsToLength] [int] NULL,
[MapsToScale] [int] NULL,
[MapsToPrecision] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [di].[DataTypeMap] ADD CONSTRAINT [PK_DataTypeMap] PRIMARY KEY CLUSTERED  ([DataTypeMapID]) ON [PRIMARY]
GO
