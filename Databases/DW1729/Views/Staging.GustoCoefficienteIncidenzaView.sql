SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [Staging].[GustoCoefficienteIncidenzaView]
AS
SELECT
	G.IDGusto,
	1.0 * SUM(OGA.Qta) / (SELECT SUM(Qta) FROM GRUPPOARGENTA.OrdiniGruppoArgenta) AS CoefficienteIncidenza

FROM GRUPPOARGENTA.OrdiniGruppoArgenta OGA
INNER JOIN GRUPPOARGENTA.Gusto G ON G.Gusto = OGA.Gusto
GROUP BY G.IDGusto;
GO
