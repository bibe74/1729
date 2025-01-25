SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[FactSimulazioniView]
AS
WITH Simulazioni
AS (
	SELECT
		OP.Offerta,
		OP.Gusto,
		QS.QtaSimulazione,
		QS.QtaSimulazione * GCI.CoefficienteIncidenza * OP.Prezzo AS Importo

	FROM Staging.QtaSimulazioni QS
	CROSS JOIN Staging.GustoCoefficienteIncidenza GCI
	INNER JOIN Staging.OffertaPrezzo OP ON OP.IDGusto = GCI.IDGusto
)
SELECT
	DO.PKOfferta,
	DA.PKArticolo,
	S.QtaSimulazione,

	S.Importo

FROM Simulazioni S
INNER JOIN dbo.DimArticolo DA ON DA.Articolo = S.Gusto AND DA.TipoArticolo = N'Caffè'
INNER JOIN dbo.DimOfferta DO ON DO.Offerta = S.Offerta

UNION ALL

SELECT
	DO.PKOfferta,
	DA.PKArticolo,
	S.QtaSimulazione,

	S.QtaSimulazione * A.CoefficienteImpiego * A.Prezzo AS Importo

FROM (
	SELECT DISTINCT
		S.Offerta,
		QtaSimulazione

	FROM Simulazioni S
) S
INNER JOIN dbo.DimOfferta DO ON DO.Offerta = S.Offerta AND DO.HasCostoAccessori = 1
CROSS JOIN GRUPPOARGENTA.Accessorio A
INNER JOIN dbo.DimArticolo DA ON DA.Articolo = A.Articolo AND DA.TipoArticolo = N'Accessorio'

UNION ALL

SELECT
	DO.PKOfferta,
	DA.PKArticolo,
	QS.QtaSimulazione,

	DO.ImportoCanoneAnnuo AS Importo

FROM Staging.QtaSimulazioni QS
INNER JOIN dbo.DimOfferta DO ON DO.HasCanoneAnnuo = 1
INNER JOIN dbo.DimArticolo DA ON DA.TipoArticolo = N'Canone';
GO
