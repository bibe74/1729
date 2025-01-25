CREATE TABLE [Staging].[Sales_Customers]
(
[CustomerID] [int] NOT NULL,
[CustomerName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DeliveryCityID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[Sales_Customers] ADD CONSTRAINT [PK_Sales_Customers] PRIMARY KEY CLUSTERED  ([CustomerID]) ON [PRIMARY]
GO
