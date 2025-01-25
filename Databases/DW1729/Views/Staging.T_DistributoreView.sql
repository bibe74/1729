SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [Staging].[T_DistributoreView]
AS
SELECT
	LocalitaDistributore,
	COUNT(1) AS NumeroRifornimenti,
	LocalitaDistributore AS LocalitaDistributore_cleaned

FROM Staging.T_SpeseCarburanteZafira
GROUP BY LocalitaDistributore;
GO
