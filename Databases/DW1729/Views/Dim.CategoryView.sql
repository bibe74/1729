SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [Dim].[CategoryView]
AS
SELECT DISTINCT
    F.Categoria AS CategoryName,
    CAST(CASE F.Categoria
    WHEN N'Rimborso spese' THEN 1
    WHEN N'Vendita autoveicoli' THEN 1
    WHEN N'Vendita hardware' THEN 1
    ELSE 0
    END AS BIT) AS IsExtraConsulting

FROM dbo.[Fatture$] F;
GO
