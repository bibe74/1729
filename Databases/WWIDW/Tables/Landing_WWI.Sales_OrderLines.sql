CREATE TABLE [Landing_WWI].[Sales_OrderLines]
(
[OrderLineID] [int] NOT NULL,
[OrderID] [int] NOT NULL,
[Quantity] [int] NOT NULL,
[UnitPrice] [decimal] (18, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing_WWI].[Sales_OrderLines] ADD CONSTRAINT [PK_Landing_WWI_Sales_OrderLines] PRIMARY KEY CLUSTERED  ([OrderLineID]) ON [PRIMARY]
GO
