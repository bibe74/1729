
/**
 * @table IMETPQ.statoavanzamento_DatiMatrice
 * @description 

 * @depends [dbo].[stato avanzamento]

SELECT TOP 1 * FROM [SQL2012IMET\DB2012].MetraPQ.[dbo].[stato avanzamento]
*/

CREATE   VIEW IMETPQ.statoavanzamento_DatiMatriceView
AS
SELECT
	-- Chiavi
	PKDatiMatrice,

	-- Dimensioni
    DataScheda,
	CodiceMatrice,
	BarraMatrice,
	CodiceMatrice + N'/' + CAST(BarraMatrice AS NVARCHAR) AS CodiceBarraMatrice,
	IsBenestareInternoMatrice,
	DataArrivoPrevistoMatrice,
    OrdineMatrice

FROM (
	SELECT
		[N°] AS PKDatiMatrice,
        CAST([Data] AS DATE) AS DataScheda,
		LTRIM(RTRIM([Codice Metra])) AS CodiceMatrice,
		[Barra matrice] AS BarraMatrice,
		benestareInterno AS IsBenestareInternoMatrice,
		[Arrivo previsto matrice] AS DataArrivoPrevistoMatrice,
        [Ordine matrice] AS OrdineMatrice,
		ROW_NUMBER() OVER (PARTITION BY LTRIM(RTRIM([Codice Metra])), [Barra matrice] ORDER BY Revisione DESC) AS rn
	FROM [SQL2012IMET\DB2012].MetraPQ.[dbo].[stato avanzamento]
) T
WHERE T.rn = 1;
GO

