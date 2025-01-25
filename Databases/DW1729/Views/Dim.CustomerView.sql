SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [Dim].[CustomerView]
AS
SELECT
    F.Cliente AS CustomerName,
    MIN(DF.DateKey) AS FirstInvoiceDateKey

FROM dbo.[Fatture$] F
INNER JOIN Dim.Date DF ON DF.Date = F.[Data fattura]
GROUP BY F.Cliente;
GO
