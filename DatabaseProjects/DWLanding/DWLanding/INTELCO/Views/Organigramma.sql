
CREATE VIEW INTELCO.Organigramma AS 
WITH Nominativi AS 
(
	SELECT 
		N.Nominativo,
        N.NominativoResp
	FROM
		(
		SELECT
			CAST(CONCAT(T.cognome, ' ', T.nome) AS NVARCHAR(1000)) AS Nominativo,
			CAST(T.NominativoResp AS NVARCHAR(1000)) AS NominativoResp,
			ROW_NUMBER() OVER (PARTITION BY CONCAT(T.cognome, ' ', T.nome) ORDER BY T.ImportTs DESC) AS RN
		FROM INTELCO.Timbrature T
		WHERE 
			T.NominativoResp IS NOT NULL
		) N
	WHERE 
		N.RN = 1
)
,ResponsabiliGerarchia AS 
(
	-- Anchor member: Seleziona tutti i nominativi che sono responsabili (NominativoResp non presente nella colonna Nominativo)
	SELECT DISTINCT
		N.NominativoResp AS Nominativo,
		CAST('ROOT' AS NVARCHAR(1000)) AS NominativoResp,
		CAST('ROOT' AS NVARCHAR(1000)) AS PathResp,
		1 AS Livello
	FROM 
		Nominativi N
	WHERE 
		--N.NominativoResp <> '' AND 
		NOT EXISTS (SELECT N2.Nominativo FROM Nominativi N2 WHERE N2.Nominativo = N.NominativoResp	)

	UNION ALL

	-- Recursive member: Trova i dipendenti per ogni responsabile
	SELECT 
		N.Nominativo,
		N.NominativoResp,
		CAST(CONCAT(CASE WHEN RG.PathResp <> '' THEN CONCAT(RG.PathResp, ' \ ') ELSE '' END, N.NominativoResp) AS NVARCHAR(1000)) AS PathResp,
		RG.Livello + 1 AS Livello
	FROM
		Nominativi N
		INNER JOIN ResponsabiliGerarchia RG ON N.NominativoResp = RG.Nominativo
)
SELECT
	G.Nominativo,
	G.NominativoResp,
	CONCAT(G.PathResp, ' \ ', G.Nominativo) AS PathFull,
	G.Livello,
	ROW_NUMBER() OVER(ORDER BY CONCAT(G.PathResp, ' \ ', G.Nominativo)) AS RN
FROM
	ResponsabiliGerarchia G
	WHERE G.Nominativo <> ''
GO

