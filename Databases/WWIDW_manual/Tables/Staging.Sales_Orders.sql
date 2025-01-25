CREATE TABLE [Staging].[Sales_Orders]
(
[OrderID] [int] NOT NULL,
[CustomerID] [int] NOT NULL,
[OrderDate] [date] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[Sales_Orders] ADD CONSTRAINT [PK_Sales_Orders] PRIMARY KEY CLUSTERED  ([OrderID]) ON [PRIMARY]
GO
