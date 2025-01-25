CREATE TABLE [Fact].[SalesOrders]
(
[OrderLineKey] [bigint] NOT NULL IDENTITY(1, 1),
[OrderLineID] [int] NOT NULL,
[OrderID] [int] NOT NULL,
[CustomerKey] [int] NOT NULL,
[OrderDate] [date] NOT NULL,
[SalesAmount] [decimal] (29, 2) NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InsertDttm] [datetime] NOT NULL,
[UpdateDttm] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Fact].[SalesOrders] ADD CONSTRAINT [PK_Fact_SalesOrders] PRIMARY KEY CLUSTERED  ([OrderLineKey]) ON [PRIMARY]
GO
ALTER TABLE [Fact].[SalesOrders] ADD CONSTRAINT [FK_Fact_SalesOrders_CustomerKey] FOREIGN KEY ([CustomerKey]) REFERENCES [Dim].[Customer] ([CustomerKey])
GO
