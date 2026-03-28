
/**
 * @table RAGUSAPQ.FogliodiproduzionegiornalieraFoall_DatiColata
 * @description 

 * @depends [dbo].[Foglio di produzione giornaliera Foall]

SELECT TOP 1 * FROM [SQL2014MRAG\DB2014].MetraPQ.[dbo].[Foglio di produzione giornaliera Foall]
*/

CREATE   VIEW RAGUSAPQ.FogliodiproduzionegiornalieraFoall_DatiColataView
AS
SELECT
	-- Chiavi
	[N° progressivo],		-- PKDatiColata

	-- Dimensioni
	Colata,		-- Colata

	-- Modifica 2/5/2016
	--[Diametro billette],		-- DiametroBillette
	DiametroBilletta,

	Lega,		-- Lega
	LunghezzaBilletta		-- LunghezzaBilletta

FROM [SQL2014MRAG\DB2014].MetraPQ.[dbo].[Foglio di produzione giornaliera Foall];
GO

