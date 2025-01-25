SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[FactProiezioniView]
AS
WITH DateOrdini
AS (
	SELECT
		PKDataOrdine,
		DENSE_RANK() OVER (ORDER BY PKDataOrdine) AS rn

	FROM dbo.FactOrdini
	GROUP BY PKDataOrdine
)
--SELECT
--	FO.PKDataOrdine AS PKData,
--	FO.PKArticolo,
--	DO.PKOfferta,

--	FO.Qta,
--	FO.Qta * FO.Prezzo AS Importo

--FROM dbo.FactOrdini FO
--INNER JOIN dbo.DimArticolo DA ON DA.PKArticolo = FO.PKArticolo AND DA.TipoArticolo = N'Caffè'
--INNER JOIN dbo.DimOfferta DO ON DO.IDOfferta = N'GA'

--UNION ALL

SELECT
	FO.PKDataOrdine AS PKData,
	FO.PKArticolo,
	DO.PKOfferta,

	FO.Qta,
	FO.Qta * OP.Prezzo AS Importo

FROM dbo.FactOrdini FO
INNER JOIN dbo.DimArticolo DA ON DA.PKArticolo = FO.PKArticolo AND DA.TipoArticolo = N'Caffè'
INNER JOIN Staging.OffertaPrezzo OP ON OP.Gusto = DA.Articolo
INNER JOIN dbo.DimOfferta DO ON OP.Offerta = DO.Offerta

UNION ALL

SELECT
	FO.PKDataOrdine AS PKData,
	DA.PKArticolo,
	DO.PKOfferta,

	FO.Qta * A.CoefficienteImpiego AS Qta,
	FO.Qta * A.CoefficienteImpiego * A.Prezzo AS Importo

FROM (
	SELECT
		PKDataOrdine,
		SUM(Qta) AS Qta

	FROM dbo.FactOrdini
	GROUP BY PKDataOrdine
) FO
INNER JOIN dbo.DimOfferta DO ON DO.HasCostoAccessori = 1
CROSS JOIN GRUPPOARGENTA.Accessorio A
INNER JOIN dbo.DimArticolo DA ON DA.Articolo = A.Articolo AND DA.TipoArticolo = N'Accessorio'

UNION ALL

SELECT
	DtO.PKDataOrdine AS PKData,
	DA.PKArticolo,
	DO.PKOfferta,
	0 AS Qta,
	DO.ImportoCanoneAnnuo / 365.0 * DATEDIFF(DAY, DtO0.PKDataOrdine, DtO.PKDataOrdine) AS Importo

FROM dbo.DimOfferta DO
INNER JOIN dbo.DimArticolo DA ON DA.TipoArticolo = N'Canone'
CROSS JOIN DateOrdini DtO
INNER JOIN DateOrdini DtO0 ON DtO0.rn = DtO.rn - 1
WHERE DO.HasCanoneAnnuo = 1;
GO
