CREATE TABLE [Landing_WWI].[Sales_Orders]
(
[OrderID] [int] NOT NULL,
[CustomerID] [int] NOT NULL,
[OrderDate] [date] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing_WWI].[Sales_Orders] ADD CONSTRAINT [PK_Landing_WWI_Sales_Orders] PRIMARY KEY CLUSTERED  ([OrderID]) ON [PRIMARY]
GO
