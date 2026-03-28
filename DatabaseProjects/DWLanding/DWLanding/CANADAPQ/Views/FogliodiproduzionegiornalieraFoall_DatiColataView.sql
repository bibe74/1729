
/**
 * @table CANADAPQ.FogliodiproduzionegiornalieraFoall_DatiColata
 * @description 

 * @depends [dbo].[Foglio di produzione giornaliera Foall]

SELECT TOP 1 * FROM [192.168.216.247\DB2017].MetraPQ.[dbo].[Foglio di produzione giornaliera Foall]
*/

CREATE   VIEW CANADAPQ.FogliodiproduzionegiornalieraFoall_DatiColataView
AS
SELECT
	-- Chiavi
	[N° progressivo],  -- PKDatiColata

	-- Dimensioni
	Colata,  -- Colata
	CAST(DiametroBilletta AS DECIMAL(28, 12)) AS DiametroBilletta,  -- DiametroBillette
	Lega,  -- Lega
	CAST(LunghezzaBilletta AS DECIMAL(28, 12)) AS LunghezzaBilletta,
	CAST(COALESCE(PesoTeoricoBilletta, 0.0) AS DECIMAL(28, 12)) AS PesoTeoricoBilletta

FROM [192.168.216.247\DB2017].MetraPQ.[dbo].[Foglio di produzione giornaliera Foall];
GO

