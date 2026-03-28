
/**
 * @table IMETPQ.FogliodiproduzionegiornalieraFoall_DatiColata
 * @description 

 * @depends [dbo].[Foglio di produzione giornaliera Foall]

SELECT TOP 1 * FROM [SQL2012IMET\DB2012].MetraPQ.[dbo].[Foglio di produzione giornaliera Foall]
*/

CREATE   VIEW IMETPQ.FogliodiproduzionegiornalieraFoall_DatiColataView
AS
SELECT
	-- Chiavi
	[N° progressivo],		-- PKDatiColata

	-- Dimensioni
	Colata,		-- Colata

	-- Modifica 2/5/2016
	--[Diametro billette],		-- DiametroBillette
	DiametroBilletta,		-- DiametroBillette

	Lega,		-- Lega
	LunghezzaBilletta		-- LunghezzaBilletta

FROM [SQL2012IMET\DB2012].MetraPQ.[dbo].[Foglio di produzione giornaliera Foall];
GO

