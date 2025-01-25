CREATE TABLE [Dim].[Customer]
(
[CustomerKey] [int] NOT NULL IDENTITY(1, 1),
[CustomerID] [int] NOT NULL,
[CustomerName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DeliveryCityKey] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NOT NULL,
[ChangeHashKey] [varbinary] (20) NOT NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[InsertDttm] [datetime] NOT NULL,
[UpdateDttm] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Dim].[Customer] ADD CONSTRAINT [PK_Dim_Customer] PRIMARY KEY CLUSTERED  ([CustomerKey]) ON [PRIMARY]
GO
ALTER TABLE [Dim].[Customer] ADD CONSTRAINT [FK_Dim_Customer_DeliveryCityKey] FOREIGN KEY ([DeliveryCityKey]) REFERENCES [Dim].[City] ([CityKey])
GO
