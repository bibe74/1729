CREATE TABLE [Dim].[Customer]
(
[CustomerKey] [int] NOT NULL IDENTITY(1, 1),
[CustomerName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstInvoiceDateKey] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Dim].[Customer] ADD CONSTRAINT [PK_Dim_Customer] PRIMARY KEY CLUSTERED  ([CustomerKey]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Dim_Customer_CustomerName] ON [Dim].[Customer] ([CustomerName]) ON [PRIMARY]
GO
ALTER TABLE [Dim].[Customer] ADD CONSTRAINT [FK_Dim_Customer_FirstInvoiceDateKey] FOREIGN KEY ([FirstInvoiceDateKey]) REFERENCES [Dim].[Date] ([DateKey])
GO
