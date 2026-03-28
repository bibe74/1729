
/**
 * @table RAGUSAPQ.statoavanzamento_RevisioniMatrici
 * @description 

 * @depends [dbo].[stato avanzamento]

SELECT TOP 1 * FROM [SQL2014MRAG\DB2014].MetraPQ.[dbo].[stato avanzamento]
*/

CREATE   VIEW RAGUSAPQ.statoavanzamento_RevisioniMatriciView
AS
WITH RevisioniMatrici
AS (
    SELECT
        SA.[N°],
        LTRIM(RTRIM(SA.[Codice Metra])) AS [Codice Metra], -- CodiceMatrice
        SA.[Barra matrice], -- BarraMatrice
        SA.Revisione, -- Revisione
        CAST(SA.DataRevisione AS DATE) AS DataRevisione, -- DataRevisione
        COALESCE(SA.TipoAzione, N'') AS TipoAzione, -- TipoAzione
        COALESCE(SA.[Arrivo previsto matrice], CAST('19000101' AS DATE)) AS [Arrivo previsto matrice],
        COALESCE(SA.[Arrivo effettivo matrice], CAST('19000101' AS DATE)) AS [Arrivo effettivo matrice],
        COALESCE(SA.[Ordine matrice], N'') AS [Ordine matrice],
        COALESCE(SA.NumeroOrdineFornitore, N'') AS NumeroOrdineFornitore

    FROM [SQL2014MRAG\DB2014].MetraPQ.[dbo].[stato avanzamento] SA
)
SELECT
    RM.[N°],
    RM.[Codice Metra],
    RM.[Barra matrice],
    RM.[Codice Metra] + N'/' + CAST(RM.[Barra matrice] AS NVARCHAR) AS CodiceBarraMatrice,
    RM.Revisione,
    RM.DataRevisione,
    RM.TipoAzione,
    RM.[Arrivo previsto matrice],
    RM.[Arrivo effettivo matrice],
    RM.[Ordine matrice],
    RM.NumeroOrdineFornitore

FROM RevisioniMatrici RM;
GO

