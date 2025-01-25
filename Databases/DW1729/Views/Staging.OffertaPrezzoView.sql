SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [Staging].[OffertaPrezzoView]
AS
WITH GustoUltimoPrezzoGruppoArgentaDettaglio
AS (
	SELECT
		Gusto,
		Prezzo,
		ROW_NUMBER() OVER (PARTITION BY Gusto ORDER BY DataOrdine DESC) AS rn

	FROM GRUPPOARGENTA.OrdiniGruppoArgenta
)
SELECT
	N'GA' AS IDOfferta,
	N'Gruppo Argenta' AS Offerta,
	G.IDGusto,
	G.Gusto,
	GUPGAD.Prezzo

FROM GustoUltimoPrezzoGruppoArgentaDettaglio GUPGAD
INNER JOIN GRUPPOARGENTA.Gusto G ON G.Gusto = GUPGAD.Gusto
WHERE GUPGAD.rn = 1

UNION ALL

SELECT
	O.IDOfferta,
	O.Offerta,
	G.IDGusto,
	G.Gusto,
	CASE G.GruppoPrezzi
		WHEN N'037' THEN O.Prezzo037
		WHEN N'039' THEN O.Prezzo039
		WHEN N'045' THEN O.Prezzo045
	END AS Prezzo

FROM GRUPPOARGENTA.Offerta O
CROSS JOIN GRUPPOARGENTA.Gusto G;
GO
