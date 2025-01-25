SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [Staging].[T_SpeseCarburanteZafiraView]
AS
WITH SpeseCarburanteZafira
AS (
	SELECT
		ROW_NUMBER() OVER (ORDER BY Data) AS rn,
		Data,
        KmTotali,
        TipoCarburante,
        LocalitaDistributore,
        EuroMetano,
        EuroKgMetano,
        EuroBenzina,
        EuroLitroBenzina

	FROM ZAFIRA.SpeseCarburanteZafira
)
SELECT
	SCZ.rn,
    SCZ.Data,
    --SCZ.KmTotali,
    --SCZ.TipoCarburante,
	CASE WHEN SCZ.rn > 2 AND SCZ0.TipoCarburante = 'M' THEN SCZ.KmTotali - SCZ0.KmTotali END AS KmMetano,
	CASE WHEN SCZ.rn > 2 AND SCZ0.TipoCarburante = 'B' THEN SCZ.KmTotali - SCZ0.KmTotali END AS KmBenzina,
    SCZ.LocalitaDistributore,
    SCZ.EuroMetano,
    SCZ.EuroKgMetano,
    SCZ.EuroBenzina,
    SCZ.EuroLitroBenzina

FROM SpeseCarburanteZafira SCZ
LEFT JOIN SpeseCarburanteZafira SCZ0 ON SCZ0.rn = SCZ.rn - 1;
GO
