SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [Fact].[InvoicesView]
AS
SELECT
    DF.DateKey AS InvoiceDateKey,
    DF.Year AS InvoiceYear,
    CAST(F.Progressivo AS INT) AS InvoiceNumber,
    F.[Numero fattura] AS InvoiceID,
    C.CustomerKey,
    Cat.CategoryKey,
    COALESCE(VC.VATCodeKey, -1) AS VatCodeKey,

    F.[Imponibile prestazioni] AS LineAmount,
    F.[Rivalsa parziale INPS] AS PartialCompensationAmount,
    F.[Totale imponibile] AS InvoiceAmount,
    F.[Importo IVA] AS VATAmount,
    F.[Totale fattura] AS TotalAmount,
    F.[Ritenuta acconto] AS WithHoldingTaxAmount,
    F.[Netto da versare] AS NetToPayAmount,
    F.Pagato AS PaidAmount,
    F.IsSaldata AS IsSettled

FROM dbo.[Fatture$] F
INNER JOIN Dim.Date DF ON DF.Date = F.[Data fattura]
INNER JOIN Dim.Customer C ON C.CustomerName = F.Cliente
INNER JOIN Dim.Category Cat ON Cat.CategoryName = F.Categoria
LEFT JOIN Dim.VATCode VC ON VC.VATPercent = 100.0 * F.[% IVA];
GO
