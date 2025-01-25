SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [Staging].[QtaSimulazioniView]
AS
WITH StoricoOrdini
AS (
	SELECT
		SUM(OGA.Qta) AS NumeroCialde,
		DATEDIFF(DAY, MIN(OGA.DataOrdine), MAX(OGA.DataOrdine)) AS Giorni

	FROM GRUPPOARGENTA.OrdiniGruppoArgenta OGA
),
RangeQta
AS (
	SELECT
		CONVERT(INT, ROUND(0.5 * SO.NumeroCialde / SO.Giorni * 365.0 / 100.0, 0) * 100) AS QtaMinima,
		CONVERT(INT, ROUND(1.0 * SO.NumeroCialde / SO.Giorni * 365.0 / 100.0, 0) * 100) AS QtaMassima

	FROM StoricoOrdini SO
),
Numbers
AS (
	SELECT TOP 100 ROW_NUMBER() OVER (ORDER BY O.object_id) AS Number FROM sys.objects O
)
SELECT
	CONVERT(SMALLINT, RQ.QtaMinima + (N.Number - 1) * 100) AS QtaSimulazione

FROM RangeQta RQ
INNER JOIN Numbers N ON N.Number <= (SELECT (RQ.QtaMassima - RQ.QtaMinima) / 100 + 1 FROM RangeQta RQ);
GO
