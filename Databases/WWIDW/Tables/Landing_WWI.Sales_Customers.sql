CREATE TABLE [Landing_WWI].[Sales_Customers]
(
[CustomerID] [int] NOT NULL,
[CustomerName] [nvarchar] (100) COLLATE Latin1_General_100_CI_AS NOT NULL,
[DeliveryCityID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing_WWI].[Sales_Customers] ADD CONSTRAINT [PK_Landing_WWI_Sales_Customers] PRIMARY KEY CLUSTERED  ([CustomerID]) ON [PRIMARY]
GO
