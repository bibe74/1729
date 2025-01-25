CREATE TABLE [Fact].[Invoices]
(
[InvoiceKey] [int] NOT NULL IDENTITY(1, 1),
[InvoiceDateKey] [int] NOT NULL,
[InvoiceYear] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InvoiceNumber] [int] NULL,
[InvoiceID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerKey] [int] NOT NULL,
[CategoryKey] [int] NOT NULL,
[VatCodeKey] [int] NOT NULL,
[LineAmount] [money] NULL,
[PartialCompensationAmount] [money] NULL,
[InvoiceAmount] [money] NULL,
[VATAmount] [money] NULL,
[TotalAmount] [money] NULL,
[WithHoldingTaxAmount] [money] NULL,
[NetToPayAmount] [money] NULL,
[PaidAmount] [money] NULL,
[IsSettled] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Fact].[Invoices] ADD CONSTRAINT [PK_Fact_Invoices] PRIMARY KEY CLUSTERED  ([InvoiceKey]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Fact_Invoices_InvoiceID] ON [Fact].[Invoices] ([InvoiceID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Fact_Invoices_InvoiceYear_InvoiceNumber] ON [Fact].[Invoices] ([InvoiceYear], [InvoiceNumber]) ON [PRIMARY]
GO
ALTER TABLE [Fact].[Invoices] ADD CONSTRAINT [FK_Fact_Invoices_CategoryKey] FOREIGN KEY ([CategoryKey]) REFERENCES [Dim].[Category] ([CategoryKey])
GO
ALTER TABLE [Fact].[Invoices] ADD CONSTRAINT [FK_Fact_Invoices_CustomerKey] FOREIGN KEY ([CustomerKey]) REFERENCES [Dim].[Customer] ([CustomerKey])
GO
ALTER TABLE [Fact].[Invoices] ADD CONSTRAINT [FK_Fact_Invoices_InvoiceDateKey] FOREIGN KEY ([InvoiceDateKey]) REFERENCES [Dim].[Date] ([DateKey])
GO
ALTER TABLE [Fact].[Invoices] ADD CONSTRAINT [FK_Fact_Invoices_VatCodeKey] FOREIGN KEY ([VatCodeKey]) REFERENCES [Dim].[VATCode] ([VATCodeKey])
GO
